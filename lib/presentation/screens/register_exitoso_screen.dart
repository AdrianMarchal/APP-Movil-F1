import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterExitosoScreen extends StatelessWidget {
  const RegisterExitosoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Color.fromARGB(255, 65, 237, 71),
              ),
              const SizedBox(height: 20),
              const Text(
                '¡Usuario Registrado!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 237, 71),
                ),
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {
                  
                  context.pushReplacement("/inicial");
                },
                child: const Text("Vive la experiencia de la F1" , style: TextStyle(color: Color.fromARGB(255, 250, 249, 249), fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 65, 237, 71),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
