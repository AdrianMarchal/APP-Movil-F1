import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();
  
  factory PreferenciasUsuario() {
    return _instancia;
  }
  
  PreferenciasUsuario._internal();

  SharedPreferences? _preferences;

  initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String get getCorreoUsuario {
    return _preferences?.getString('email') ?? "";
  }

   Future<void> setEmail(String email) async {
    _preferences?.setString('email', email);
  }

  String get getPassUsuario {
    return _preferences?.getString('pass') ?? "";
  }

   Future<void> setPass(String pass) async {
    _preferences?.setString('pass', pass);
  }

  
}
