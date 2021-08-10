import 'dart:convert';
import 'package:dev_meetups/models/device.dart';
import 'package:dev_meetups/models/event.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://192.168.100.76:8080/api';

// Busca todos os eventos cadastrados
Future<List<Event>> getAllEvents() async {
  final response = await http
      .get(Uri.parse('$baseUrl/events'));

  if (response.statusCode == 200) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Event.fromJson(json)).toList();
  }
  else {
    throw Exception('Falha ao carregar os eventos');
  }
}

// Cadastra um novo token de dispositivo na aplicação web
Future<Device> createDevice(String token) async {
  final response = await http.post(
    Uri.parse('$baseUrl/devices'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'token': token,
    }),
  );

  if (response.statusCode == 201) {
    // Se o servidor retornou uma resposta 201 CREATED,
    // em seguida, converte o JSON.
    return Device.fromJson(jsonDecode(response.body));
  } else {
    // Se o servidor não retornou uma resposta 201 CREATED,
    // então lança uma exceção.
    throw Exception('Failed to create album.');
  }
}