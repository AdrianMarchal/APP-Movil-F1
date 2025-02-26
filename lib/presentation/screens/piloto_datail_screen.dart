import 'package:f1_app_final/models/piloto_model.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class PilotoDatailScreen extends StatelessWidget {
  Piloto piloto;
  Color teamColor;
  String teamLogo;
  String tag;
  PilotoDatailScreen(
      {super.key,
      required this.piloto,
      required this.teamColor,
      required this.teamLogo,
      required this.tag});

  @override
  String _formatearFecha(String fechaStr) {
    List<String> partes = fechaStr.split('-');
    if (partes.length == 3) {
      return "${partes[2]}/${partes[1]}/${partes[0]}";
    }
    return "Fecha inválida";
  }

  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: teamColor, width: 7),
                      right: BorderSide(color: Colors.transparent, width: 0),
                      bottom: BorderSide(color: teamColor, width: 0),
                      left: BorderSide(color: teamColor, width: 7),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 16,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(piloto.nombre,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    piloto.numeroF1.toString(),
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 65, 65, 65),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: SizedBox(
                                      width: 65,
                                      height: 40,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(3),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: FadeInImage(
                                            fit: BoxFit.cover,
                                            placeholder: const AssetImage(
                                                'assets/images/loading.gif'),
                                            image: (piloto.bandera.isEmpty)
                                                ? const AssetImage(
                                                        'assets/images/no-image.jpg')
                                                    as ImageProvider
                                                : NetworkImage(piloto.bandera),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/no-image.jpg',
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Fecha nacimiento: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _formatearFecha(piloto.fechaNacimiento),
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Text(
                                  "Edad: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(piloto.edad.toString(),
                                    style: const TextStyle(fontSize: 18))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Hero(
                  tag: tag,
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 360,
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder:
                              const AssetImage('assets/images/loading.gif'),
                          image: (piloto.img == null || piloto.img.isEmpty)
                              ? const AssetImage('assets/images/no-image.jpg')
                                  as ImageProvider
                              : NetworkImage(piloto.img),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/no-image.jpg',
                                fit: BoxFit.cover);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ShowUpAnimation(
                delayStart: const Duration(seconds: 0),
                animationDuration: const Duration(milliseconds: 500),
                curve: Curves.bounceIn,
                direction: Direction.horizontal,
                offset: 0.10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.transparent, width: 0),
                        right: BorderSide(color: Colors.grey, width: 3),
                        bottom: BorderSide(color: Colors.grey, width: 3),
                        left: BorderSide(color: Colors.transparent, width: 0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Equipo",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                            Row(
                              children: [
                                Text(
                                  piloto.equipoActual,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Image.network(
                                  teamLogo,
                                  width: 65,
                                  height: 65,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CardDatosPiloto(
                  piloto: piloto, teamColor: teamColor, teamLogo: teamLogo)
            ],
          ),
        ),
      ),
    );
  }
}

class CardDatosPiloto extends StatelessWidget {
  Piloto piloto;
  Color teamColor;
  String teamLogo;
  CardDatosPiloto({
    super.key,
    required this.piloto,
    required this.teamColor,
    required this.teamLogo,
  });

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(seconds: 0),
      animationDuration: const Duration(milliseconds: 1000),
      curve: Curves.bounceIn,
      direction: Direction.horizontal,
      offset: 0.10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: teamColor, width: 0),
                right: BorderSide(color: teamColor, width: 7),
                bottom: BorderSide(color: teamColor, width: 7),
                left: BorderSide(color: Colors.transparent, width: 0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      "Estadisticas",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ),
                  ShowUpAnimation(
                    delayStart: const Duration(seconds: 0),
                    animationDuration: const Duration(milliseconds: 2000),
                    curve: Curves.bounceIn,
                    direction: Direction.horizontal,
                    offset: 0.10,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 10, left: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Carreras: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                piloto.carreras.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                "Victorias: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(piloto.victorias.toString(),
                                  style: const TextStyle(fontSize: 18))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ShowUpAnimation(
                    delayStart: const Duration(seconds: 0),
                    animationDuration: const Duration(milliseconds: 2500),
                    curve: Curves.bounceIn,
                    direction: Direction.horizontal,
                    offset: 0.10,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 10, left: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Poles: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                piloto.poles.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                "Podios: ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(piloto.podios.toString(),
                                  style: const TextStyle(fontSize: 18))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CampeonatosAnimados(campeonatos: piloto.campeonatosMundiales)
                ],
              ),
            )),
      ),
    );
  }
}

class CampeonatosAnimados extends StatefulWidget {
  final int campeonatos;
  const CampeonatosAnimados({Key? key, required this.campeonatos})
      : super(key: key);

  @override
  _CampeonatosAnimadosState createState() => _CampeonatosAnimadosState();
}

class _CampeonatosAnimadosState extends State<CampeonatosAnimados> {
  int trofeosMostrados = 0;

  @override
  void initState() {
    super.initState();
    _mostrarTrofeos();
  }

  void _mostrarTrofeos() async {
    await Future.delayed(const Duration(milliseconds: 1700));
    for (int i = 0; i < widget.campeonatos; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        setState(() {
          trofeosMostrados++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(seconds: 0),
      animationDuration: const Duration(milliseconds: 3000),
      curve: Curves.bounceIn,
      direction: Direction.horizontal,
      offset: 0.10,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 10, left: 10),
        child: Row(
          children: [
            const Text(
              "Campeonatos: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.campeonatos.toString(),
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Row(
              children: List.generate(
                trofeosMostrados,
                (index) => ShowUpAnimation(
                  delayStart: Duration(milliseconds: 500),
                  animationDuration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutBack,
                  direction: Direction.vertical,
                  offset: 0.5,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child:
                        Icon(Icons.emoji_events, color: Colors.amber, size: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
