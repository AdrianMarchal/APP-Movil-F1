
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  final preferencias = PreferenciasUsuario();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    Stream.periodic(const Duration(milliseconds: 50), (value) {
      return (value * 1.0) / 100;
    }).takeWhile((value) => value <= 1).listen((value) {
      setState(() {
        progressValue = value;
      });
    });

    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      await validaUsuario();
    }
  }


  Future<void> validaUsuario() async {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.login(widget.preferencias.getCorreoUsuario, widget.preferencias.getPassUsuario);
    print(widget.preferencias.getCorreoUsuario);
    print(widget.preferencias.getPassUsuario);
    print(userProvider.user);
    if (userProvider.user != null) {
      context.pushReplacement("/inicial");
    } else {
      context.pushReplacement('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double carPosition = 10 + (screenWidth - 60) * progressValue; // Movimiento del coche

    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 30, 30, 30),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Image(
            image: AssetImage('assets/images/logo_bueno.png'),
            width: 350,
          ),
          const SizedBox(height: 150),
          Stack(
            clipBehavior: Clip.none, // Permite que el coche sobresalga
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  value: progressValue,
                  color: const Color.fromARGB(255, 255, 1, 0),
                  backgroundColor: Colors.grey[800],
                  minHeight: 8, // Grosor de la barra
                ),
              ),
              Positioned(
                top: -15, // Ajusta para que el coche se superponga sobre la barra
                left: carPosition,
                child: const Image(
                  image: AssetImage('assets/images/coche.png'),
                  width: 75,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  }
}
