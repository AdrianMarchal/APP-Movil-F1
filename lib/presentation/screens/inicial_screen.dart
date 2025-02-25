
import 'package:f1_app_final/presentation/widgets/navbar_widget.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InicialScreen extends StatelessWidget {
  final preferencias = PreferenciasUsuario();
  InicialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo_bueno.png"),
            ),
          ),
        ),
        centerTitle: true,
        
        actions: <Widget>[
            PopupMenuButton<String>(
              icon: const Icon(Icons.account_circle, color: Colors.white,),
              onSelected: (String value) {
                
                if (value == 'view_profile') {
                  context.push('/perfil');
                } else if (value == 'logout') {
                  preferencias.setEmail("");
                  preferencias.setPass("");
                  context.pushReplacement('/login');
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'view_profile',
                    child: Row(
                      children: [
                        Icon(Icons.person,), // Icono de persona
                        SizedBox(width: 8),
                        Text('Ver Perfil'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app), // Icono de cerrar sesión
                        SizedBox(width: 8),
                        Text('Cerrar sesión'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
      ),
      
      body: const BottomTabbarExample(),

      
    );
  }
}
