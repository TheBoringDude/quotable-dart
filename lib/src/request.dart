import 'dart:convert';

import 'package:http/http.dart' as http;

// DEFAULT PRIMARY API SERVER
final API_SERVER = 'http://api.quotable.io';

Future<Map<String, dynamic>> requestHandler(String url) async {
  final response = await http.get(Uri.parse(API_SERVER + url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed request');
  }
}
