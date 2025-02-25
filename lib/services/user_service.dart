

import 'dart:convert';


import 'package:f1_app_final/models/user_model.dart';
import 'package:http/http.dart' as http;
class UserService {


  final String _url = 'https://backendf1-lsvk.onrender.com/api/v1/usuarios';

  Future<User?> getUser(String email, String password) async {
     Uri uri = Uri.parse("$_url/login");
    Map<String, String> body = {"email": email, "password": password};
    Map<String, String> headers = {
      "Content-Type": "application/json", 
      "Accept": "application/json" 
    };

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(body),
    );

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    if (jsonResponse.containsKey('user')) {
      final userResponse = userResponseFromJson(response.body);
      return userResponse.user;
    } else {
      return null;
    }
  }

  postUser(String name, String email, String password) async {
    Uri uri = Uri.parse("$_url/addUser");
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      }),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      return User(name: name, email: email, password: '', tipoUser: '', id: '', authToken: '');
    }
    return null;
  }

  putUser(String name, String email, String api_token) async {
    Uri uri = Uri.parse("$_url/update?authToken=$api_token");
    print(uri);
    final response = await http.put(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}