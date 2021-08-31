import 'dart:io';
import 'package:meetups/http/web.dart';
import 'package:meetups/models/device.dart';
import 'package:meetups/screens/events_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Notificações ios precisam de permissões dadas pelos usuários
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Permissão concedida pelo usuário: ${settings.authorizationStatus}');

    _startPushNotificationsHandler(messaging);
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('Permissão concedida provisóriamente pelo usuário: ${settings.authorizationStatus}');
    _startPushNotificationsHandler(messaging);
  } else {
    print('Permissão negada pelo usuário');
  }


  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev meetups',
      home: EventsScreen(),
      navigatorKey: navigatorKey,
    );
  }
}

void _startPushNotificationsHandler(FirebaseMessaging messaging) async {

  // Obtensão do token
  String? token = await messaging.getToken(
    vapidKey: 'Seu certificados push da Web aqui',
  );
  print('TOKEN: $token');

  _setPushToken(token);

  // Mensagem em foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Recebi uma mensagem enquanto estava em primeiro plano!');
    print('Dados da mensagem: ${message.data}');

    if (message.notification != null) {
      print('A mensagem também continha uma notificação: ${message.notification!.title}, ${message.notification!.body}');
    }
  });

  // Background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Mensagem que inicializa o app
  var data = await FirebaseMessaging.instance.getInitialMessage();

  if(data!.data["message"].length > 0)
    showMyDialog(data!.data["message"]);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print("Mensagem recebida em background: ${message.data}");
}

void _setPushToken(String? token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? prefsToken = prefs.getString('pushToken');
  bool? prefsSent = prefs.getBool('tokenSent');

  print('Prefs token - $prefsToken');

  if((prefsToken != token && token != null) || (prefsToken == token && prefsSent == false)) {
    print('Enviando o token para o servidor');

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? brand;
    String? model;

    // Mostrar os vários tipos de tratamento que existem
    // https://github.com/fluttercommunity/plus_plugins/blob/main/packages/device_info_plus/device_info_plus/example/lib/main.dart#L43

    // Explicar os tipos de notificações:
    // - Dados
    //    Foreground e background
    // - Notificação
    //       Terminated

    if(Platform.isAndroid) {

      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

      model = androidInfo.model;
      brand = androidInfo.brand;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"

      model = iosInfo.utsname.machine;
      brand = 'Apple';
    }

    Device device = Device(token: token, brand: brand, model: model);
    sendDevice(device);
  }
}

void showMyDialog(String message) {

  Widget okButton =   OutlinedButton(
    onPressed: () => Navigator.pop(navigatorKey.currentContext!),
    child: Text('Ok'),
  );

  AlertDialog alerta = AlertDialog(
    title: Text("Promoção Imperdivel"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}