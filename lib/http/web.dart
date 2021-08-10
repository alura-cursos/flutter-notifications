import 'dart:convert';
import 'package:meetups/models/event.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://192.168.100.76:8080/api';

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
