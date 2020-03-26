import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WebClient {
  const WebClient();

  Future<dynamic> get(String url) async {
    final response = await http.Client().get(url);
    switch (response.statusCode) {
      case 200:
        final dynamic decodedJSON = await compute<String, dynamic>(
          _decode,
          response.body,
          debugLabel: 'JSON Decoding',
        );
        return decodedJSON;
      case 401:
      case 403:
        throw Exception('Unable to download data from server');
      case 500:
      default:
        throw Exception('Communication error with server');
    }
  }
}

Future<dynamic> _decode(String jsonString) async {
  return json.decode(jsonString);
}
