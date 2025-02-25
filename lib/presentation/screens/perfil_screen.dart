import 'package:f1_app_final/models/user_model.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatelessWidget {
  final preferencias = PreferenciasUsuario();
  PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    User? user = userProvider.user;
    void cargaUsuario() async {
      if (user == null) {
        await userProvider.login(
            preferencias.getCorreoUsuario, preferencias.getPassUsuario);
        user = userProvider.user;
      }
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
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
        ),
        body: user == null
            ? const Center(
                child: Image(
                image: AssetImage('assets/images/loading.gif'),
                height: 200,
              ))
            : SingleChildScrollView(child: _PerfilScreen(user: user!)));
  }
}
// ignore: must_be_immutable
class _PerfilScreen extends StatefulWidget {
  final preferencias = PreferenciasUsuario();
  User user;
  _PerfilScreen({super.key, required this.user});

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<_PerfilScreen> {
  bool isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  String? emailError;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String value) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Correo electrónico no válido';
    }
    return null;
  }

    

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    void updateUser() async {
     bool? creado = await userProvider.update(_nameController.text, _emailController.text);
      
      if (creado == true) {
        await userProvider.login(_emailController.text, widget.preferencias.getPassUsuario);
        widget.preferencias.setEmail(_emailController.text);
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Usuario Actualizado', style: TextStyle(color: Colors.white),),
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            action: SnackBarAction(label: 'OK', textColor: Colors.white, onPressed: () {}),
          ),
         );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Error al actualizar'),
            backgroundColor: Color.fromARGB(255,255,1,0),
            action: SnackBarAction(label: 'OK', textColor: Colors.white, onPressed: () {}),
          ),
        );
      }
  }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                  right: BorderSide(color: Colors.transparent, width: 0),
                  bottom: BorderSide(color: Colors.transparent, width: 0),
                  left: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Perfil",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.transparent, width: 0),
                  right: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                  left: BorderSide(color: Colors.transparent, width: 0),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Nombre: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              widget.user.name,
                              style: TextStyle(fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Correo electronico: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              widget.user.email,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                  right: BorderSide(color: Colors.transparent, width: 0),
                  bottom: BorderSide(color: Colors.transparent, width: 0),
                  left: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Editar Perfil",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Switch(
                      activeTrackColor: Color.fromARGB(255, 255, 1, 0),
                      value: isEditing,
                      onChanged: (value) {
                        setState(() {
                          isEditing = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.transparent, width: 0),
                  right: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 7),
                  left: BorderSide(color: Colors.transparent, width: 0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Campos editables siempre visibles pero deshabilitados hasta que el switch se active
                    TextField(
                      controller: _nameController,
                      enabled: isEditing, // Deshabilitado hasta que el switch esté activado
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      enabled: isEditing, // Deshabilitado hasta que el switch esté activado
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        border: OutlineInputBorder(),
                        errorText: emailError, // Mostrar error si es inválido
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          emailError = _validateEmail(value);
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isEditing && emailError == null
                          ? () {
                              updateUser();
                            }
                          : null, // Deshabilitado hasta que el switch esté activado y el correo sea válido
                      child: const Text('Guardar Cambios', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
            height: 250,
            width: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo_bueno.png"),
              ),
            ),
          ),
      ],
    );
  }
  

}