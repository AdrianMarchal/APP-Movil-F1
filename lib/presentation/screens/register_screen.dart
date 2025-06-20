import 'package:f1_app_final/models/user_model.dart';
import 'package:f1_app_final/presentation/widgets/custom_text_form_field.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                const SizedBox(height: 40),
                _RegisterForm(onRegister: _registerUser),
              ],
            ),
          ),
          if (_isLoading)
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                    child: Image(
                  image: AssetImage('assets/images/loading.gif'),
                  height: 200,
                ))),
        ],
      ),
    );
  }

  void _registerUser(String name, String email, String password) async {
    setState(() {
      _isLoading = true;
    });

    UserProvider userProvider = Provider.of(context, listen: false);
    final preferencias = PreferenciasUsuario();
    User? user = await userProvider.register(name, email, password);

    if (user != null) {
      await userProvider.login(email, password);
      setState(() {
        _isLoading = false;
      });
      preferencias.setPass(password);
      preferencias.setEmail(email);
      context.pushReplacement("/exito");
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Error al registrar usuario'),
          backgroundColor: const Color.fromARGB(255, 255, 1, 0),
          action: SnackBarAction(
              label: 'OK', textColor: Colors.white, onPressed: () {}),
        ),
      );
    }
  }
}

class _RegisterForm extends StatefulWidget {
  final Function(String, String, String) onRegister;

  const _RegisterForm({required this.onRegister});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
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
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        child: Form(
          key: _formKey,
          onChanged: _validateForm,
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Nombre',
                icon: const Icon(Icons.person),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Campo requerido';
                  }
                  return null;
                },
                onChanged: (value) {
                  name = value;
                  _validateForm();
                },
              ),
              const SizedBox(height: 20),
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
                  if (valor.length < 4) {
                    return 'Debe tener al menos 4 caracteres';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                  _validateForm();
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 255, 1, 0))),
                child: const Text('Registrarse',
                    style: TextStyle(color: Colors.white)),
                onPressed: isFormValid
                    ? () {
                        widget.onRegister(name, email, password);
                      }
                    : null,
              ),
              TextButton(
                onPressed: () {
                  context.push("/login");
                },
                child: const Text(
                  "¿Ya tienes cuenta? Inicia sesión",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
