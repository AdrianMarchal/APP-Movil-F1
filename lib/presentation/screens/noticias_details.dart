import 'package:f1_app_final/models/noticias_model.dart';
import 'package:f1_app_final/models/user_model.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';


class NoticiasDetails extends StatelessWidget {
  final preferencias = PreferenciasUsuario();
  Noticia noticia;
  NoticiasDetails({super.key, required this.noticia});

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

    cargaUsuario();
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: userProvider.user == null
          ? const Center(
              child: Image(
              image: AssetImage('assets/images/loading.gif'),
              height: 200,
            ))
          : SingleChildScrollView(
              child: _NoticiasDdetailsScreen(noticia: noticia),
            ),
    );
  }
}

class _NoticiasDdetailsScreen extends StatelessWidget {
  Noticia noticia;
  _NoticiasDdetailsScreen({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                    "Noticias",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Hero(
            tag: "${noticia.id}noticia",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  image: (noticia.img == null || noticia.img.isEmpty)
                      ? const AssetImage('assets/images/no-image.jpg')
                          as ImageProvider
                      : NetworkImage(noticia.img),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/no-image.jpg',
                        fit: BoxFit.cover);
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
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
                    Text(
                      noticia.titulo,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noticia.escritor,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Evita el desbordamiento
                            ),
                            Text(
                              noticia.lanzada,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Evita el desbordamiento
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            final url = noticia.url;
                            await Share.share(url);
                          },
                          icon: const Icon(
                            Icons.share_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: noticia.cuerpo.split('\n').map((parrafo) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    parrafo,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
