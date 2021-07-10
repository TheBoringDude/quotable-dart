import 'dart:convert';

import 'package:http/http.dart' as http;

// DEFAULT PRIMARY API SERVER
final API_SERVER = 'http://api.quotable.io';

Future<String> _request(String url) async {
  final response = await http.get(Uri.parse(API_SERVER + url));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed request');
  }
}

// custom function wrapper for handler request with map as a result
Future<Map<String, dynamic>> requestHandler(String url) async {
  final r = await _request(url);

  return jsonDecode(r);
}

// custom function wrapper for handler request with list as a result
Future<List<dynamic>> requestListHandler(String url) async {
  final r = await _request(url);

  return jsonDecode(r);
}
