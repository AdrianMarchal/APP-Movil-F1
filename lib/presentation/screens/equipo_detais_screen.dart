
import 'package:f1_app_final/models/equipo_model.dart';
import 'package:f1_app_final/models/piloto_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EquipoDetaisScreen extends StatelessWidget {
  Equipo equipo;
  Color teamColor;
  String teamLogo;
  String tag;
  EquipoDetaisScreen(
      {super.key,
      required this.equipo,
      required this.teamColor,
      required this.teamLogo,
      required this.tag});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            equipo.alias,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 52, 52, 52),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Spacer(),
                          Image.network(
                          teamLogo,
                          width: 65,
                          height: 65,
                        ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: const AssetImage('assets/images/loading.gif'),
                    image: (equipo.img == null || equipo.img.isEmpty)
                        ? const AssetImage('assets/images/no-image.jpg')
                            as ImageProvider
                        : NetworkImage(equipo.img,) ,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/no-image.jpg',
                          fit: BoxFit.cover);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width - 16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.transparent, width: 0),
                    right: BorderSide(color: Colors.grey, width: 3),
                    bottom: BorderSide(color: Colors.grey, width: 3),
                    left: BorderSide(color: Colors.transparent, width: 0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                                "Informacion",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,top: 2),
                      child: Row(
                        children: [
                          const Text(
                            "Nombre completo: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              equipo.nombreCompleto,
                              style: const TextStyle(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Text("Sede: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(
                                  equipo.sede,
                                  style: const TextStyle(fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: SizedBox(
                                width: 40,
                                height: 25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    placeholder: const AssetImage(
                                        'assets/images/loading.gif'),
                                    image: (equipo.bandera.isEmpty)
                                        ? const AssetImage(
                                                'assets/images/no-image.jpg')
                                            as ImageProvider
                                        : NetworkImage(equipo.bandera),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
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
                width: MediaQuery.of(context).size.width - 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                                "Coche",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Chasis actual: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Flexible(
                                        child: Text(
                                      equipo.chasis,
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Motor actual: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Flexible(
                                      child: Text(
                                        equipo.motor,
                                        style: const TextStyle(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Center(
                      child: Hero(
                        tag: tag,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder:
                                  const AssetImage('assets/images/loading.gif'),
                              image:
                                  (equipo.coche == null || equipo.coche.isEmpty)
                                      ? const AssetImage(
                                              'assets/images/no-image.jpg')
                                          as ImageProvider
                                      : NetworkImage(equipo.coche),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/no-image.jpg',
                                    fit: BoxFit.cover);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardDatosEquipo(
                equipo: equipo,
                teamColor: teamColor,
                teamLogo: teamLogo,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardDatosEquipo extends StatelessWidget {
  String teamLogo;
  Color teamColor;
  Equipo equipo;
  CardDatosEquipo(
      {super.key,
      required this.equipo,
      required this.teamColor,
      required this.teamLogo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: teamColor, width: 0),
            right: BorderSide(color: teamColor, width: 7),
            bottom: BorderSide(color: teamColor, width: 7),
            left: const BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: CampeonatosAnimados(
                    campeonatos: equipo.campeonatosConstructores)),
            const Center(
              child: Text("Pilotos: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardPilotosEquiposDetails(
                  piloto: equipo.pilotoCompleto1!,
                  teamColor: teamColor,
                  teamLogo: teamLogo,
                ),
                CardPilotosEquiposDetails(
                  piloto: equipo.pilotoCompleto2!,
                  teamColor: teamColor,
                  teamLogo: teamLogo,
                )
              ],
            )
          ],
        ),
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
    await Future.delayed(const Duration(milliseconds: 1500));
    for (int i = 0; i < widget.campeonatos; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
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
      animationDuration: const Duration(milliseconds: 1000),
      curve: Curves.bounceIn,
      direction: Direction.horizontal,
      offset: 0.10,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Campeonatos de constructores: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.campeonatos.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 4,
              runSpacing: 4,
              children: List.generate(
                trofeosMostrados,
                (index) => ShowUpAnimation(
                  delayStart: const Duration(milliseconds: 500),
                  animationDuration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutBack,
                  direction: Direction.vertical,
                  offset: 0.5,
                  child: const Icon(Icons.emoji_events,
                      color: Colors.amber, size: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPilotosEquiposDetails extends StatelessWidget {
  final Piloto piloto;
  final Color teamColor;
  final String teamLogo;
  CardPilotosEquiposDetails({
    super.key,
    required this.piloto,
    required this.teamColor,
    required this.teamLogo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/detailPilotos',
          extra: {
            'piloto': piloto,
            'teamColor': teamColor,
            'teamLogo': teamLogo,
            'tag': piloto.id.toString() + "DelequipoDetails"
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: piloto.id.toString() + "DelequipoDetails",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/images/loading.gif'),
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
            Text(
              piloto.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
