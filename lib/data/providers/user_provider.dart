import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserApiClient {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  final http.Client httpClient;

  UserApiClient({required this.httpClient});

  Future<List<User>> getUsers() async {
    final response = await httpClient.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode != 200) {
      throw Exception('error getting users');
    }

    final List<dynamic> userJsonList = json.decode(response.body);
    return userJsonList.map((userJson) => User.fromJson(userJson)).toList();
  }
}
