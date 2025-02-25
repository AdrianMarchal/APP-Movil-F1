
import 'package:f1_app_final/models/circuitos_model.dart';
import 'package:f1_app_final/models/noticias_model.dart';
import 'package:f1_app_final/models/user_model.dart';
import 'package:f1_app_final/providers/circuito_provider.dart';
import 'package:f1_app_final/providers/noticias_provider.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/search/search_delegate.dart';
import 'package:f1_app_final/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final preferencias = PreferenciasUsuario();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    CircuitoProvider circuitoProvider = Provider.of<CircuitoProvider>(context);
    NoticiasProvider noticiasProvider = Provider.of<NoticiasProvider>(context);

    User? user = userProvider.user;
    void cargaUsuario() async {
      if (user == null) {
        await userProvider.login(
            preferencias.getCorreoUsuario, preferencias.getPassUsuario);
        user = userProvider.user;
      }

      if (circuitoProvider.circuitos.isEmpty) {
        circuitoProvider.getAllEquipos(user!.authToken);
      }
    }

    cargaUsuario();

    return Scaffold(
      body: circuitoProvider.circuitos.isEmpty
          ? const Center(child: Image(image: AssetImage('assets/images/loading.gif'), height: 200,))
          : _HomeScreen(
              circuitos: circuitoProvider.circuitos,
              noticias: noticiasProvider.noticias,
            ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  final List<Circuito> circuitos;
  final List<Noticia> noticias;

  _HomeScreen({super.key, required this.circuitos, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Calendario",
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
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: SizedBox(
              height: 330, // Tamaño explícito para los circuitos
              child: _ListCircuitos(circuitos: circuitos),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Noticias",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      IconButton(onPressed: () => showSearch(context: context, delegate: NoticiaSearchDelegate())
                      , icon: Icon(Icons.search, size: 35,))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: _ListNoticias(noticias: noticias),
          ),
        ],
      ),
    );
  }
}

class _ListCircuitos extends StatelessWidget {
  final List<Circuito> circuitos;

  _ListCircuitos({super.key, required this.circuitos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: circuitos.length,
      itemBuilder: (_, index) {
        Circuito circuito = circuitos[index];
        return CardCircuito(circuito: circuito);
      },
    );
  }
}

class CardCircuito extends StatelessWidget {
  Circuito circuito;
  CardCircuito({super.key, required this.circuito});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          context.push(
            "/detailCircuito",
            extra: {
              'circuito': circuito,
            },
          );
        },
        child: Container(
          width: 250,
          height: 400,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 30, 30, 30),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/images/loading.gif'),
                        image: (circuito.img == null || circuito.img.isEmpty)
                            ? const AssetImage('assets/images/no-image.jpg')
                                as ImageProvider
                            : NetworkImage(circuito.img),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/no-image.jpg',
                              fit: BoxFit.cover);
                        },
                      ),
                    ),
                  ),
                  const Divider(
                      color: Color.fromARGB(255, 255, 1, 0), thickness: 2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      circuito.nombrePremio,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "${circuito.lugar} - ${circuito.dias} ${circuito.mes}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ListNoticias extends StatelessWidget {
  final List<Noticia> noticias;

  _ListNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: noticias.map((noticia) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CardNoticias(noticia: noticia),
        );
      }).toList(),
    );
  }
}

class CardNoticias extends StatelessWidget {
  Noticia noticia;
  CardNoticias({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          context.push(
            "/detailNoticia",
            extra: {
              'noticia': noticia,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 3),
                  right: BorderSide(color: Colors.grey, width: 3),
                  bottom: BorderSide(color: Colors.grey, width: 3),
                  left: BorderSide(
                      color: Color.fromARGB(255, 255, 1, 0), width: 3),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: "${noticia.id}noticia",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      noticia.titulo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          noticia.escritor,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Evita el desbordamiento
                        ),
                        const Spacer(),
                        Text(
                          noticia.lanzada,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Evita el desbordamiento
                        ),
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
