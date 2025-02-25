

import 'package:f1_app_final/models/user_model.dart';
import 'package:f1_app_final/services/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {

  User? user;

  UserService userService = UserService();
  UserProvider(){
    
  }

  login(String email, String password) async {
    user = await userService.getUser(email,password);
    
    notifyListeners();
  }

  register(String name, String email, String password) async {
    User? user = await userService.postUser(name, email, password);
    
    return user;
  }

  update(String name, String email) async {
    print("Intento actualizar");
    print(name);
    print(email);
    return await userService.putUser(name, email, user!.authToken);
  }
}