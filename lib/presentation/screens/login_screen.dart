

import 'package:f1_app_final/presentation/widgets/custom_text_form_field.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  
  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 30),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              height: 350,
              width: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo_bueno.png"),
                ),
              ),
            ),
            const SizedBox(height: 50),
            _LoginForm(),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  final preferencias = PreferenciasUsuario();
  @override
  State<_LoginForm> createState() => _LoginFormState();
  
}

class _LoginFormState extends State<_LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isFormValid = false;
  bool _isPasswordVisible = false; 

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);

    void validaUsuario() async {
      await userProvider.login(email, password);
      
      if (userProvider.user != null) {
        widget.preferencias.setEmail(email);
        widget.preferencias.setPass(password);
        context.pushReplacement("/inicial");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255,255,1,0),
            content: const Text('Usuario o contraseña erróneos', style: TextStyle(fontWeight: FontWeight.bold),),
            action: SnackBarAction(label: 'OK', textColor: Colors.white ,onPressed: () {}),
          ),
        );
      }
    }

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        child: Form(
          key: _formKey,
          onChanged: _validateForm, 
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Correo Electrónico',
                icon: const Icon(Icons.email),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo requerido';
                  }
                  final emailRegex = RegExp(
                      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
                  if (!emailRegex.hasMatch(valor)) {
                    return 'Ingrese un correo válido';
                  }
                  return null;
                },
                onChanged: (value) {
                  email = value;
                  _validateForm();
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'Contraseña',
                icon: const Icon(Icons.lock),
                obscureText: !_isPasswordVisible, 
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo requerido';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                  _validateForm();
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; 
                    });
                  },
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255,255,1,0),)),
                child: const Text('Iniciar Sesión' , style: TextStyle(color: Colors.white),),
                onPressed: isFormValid
                    ? () {
                        validaUsuario();
                      }
                    : null, 
              ),
              TextButton(
                onPressed: () {
                  context.push("/register");
                }, 
                child: const Text("¿No tienes cuenta?", style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        ),
      ),
    );
  }
}

