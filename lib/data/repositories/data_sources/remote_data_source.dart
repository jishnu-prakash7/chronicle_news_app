import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/config/utils/api_endpoints.dart';

class NewsRepo {
  static var client = http.Client();

  static Future fetchNews() async {
    try {
      Response response = await client.get(Uri.parse(
          '${ApiEndpoints.baseUrl}${ApiEndpoints.topHeadlines}${ApiEndpoints.apiKey}'));
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
