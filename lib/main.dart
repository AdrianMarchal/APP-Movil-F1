
import 'package:f1_app_final/config/routes/app_router.dart';
import 'package:f1_app_final/providers/circuito_provider.dart';
import 'package:f1_app_final/providers/equipo_provider.dart';
import 'package:f1_app_final/providers/noticias_provider.dart';
import 'package:f1_app_final/providers/pilotos_provider.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciasUsuario().initPrefs(); 
  
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => PilotosProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => EquipoProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => CircuitoProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => NoticiasProvider(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'F1 APP',
      routerConfig: appRouter,
    );
  }
}
