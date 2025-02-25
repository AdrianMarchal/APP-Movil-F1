
import 'package:f1_app_final/models/equipo_model.dart';
import 'package:f1_app_final/models/piloto_model.dart';
import 'package:f1_app_final/models/user_model.dart';
import 'package:f1_app_final/presentation/widgets/banda_equipo_widget.dart';
import 'package:f1_app_final/providers/equipo_provider.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EquipoListScreen extends StatelessWidget {
  const EquipoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    EquipoProvider equipoProvider = Provider.of<EquipoProvider>(context);
    User user = userProvider.user!;
    if (equipoProvider.equipos.isEmpty) {
      equipoProvider.getAllEquipos(user.authToken);
    }

    return Scaffold(
        body: (equipoProvider.equipos.isEmpty)
            ? const Center(child: Image(image: AssetImage('assets/images/loading.gif'), height: 200,))
            : _EquiposListScreen(equipos: equipoProvider.equipos));
  }
}

class _EquiposListScreen extends StatelessWidget {
  List<Equipo> equipos;
  _EquiposListScreen({super.key, required this.equipos});
  ThemePerson themePerson = ThemePerson();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: equipos.length,
      itemBuilder: (context, index) {
        return CardEquipos(
            equipo: equipos[index],
            teamColor: themePerson.equipoColores[index],
            teamName: themePerson.equiposNombre[index],
            teamLogo: themePerson.miniLogos[index]);
      },
    );
  }
}

class CardEquipos extends StatelessWidget {
  final Equipo equipo;
  final Color teamColor;
  final String teamName;
  final String teamLogo;
  CardEquipos({
    super.key,
    required this.equipo,
    required this.teamColor,
    required this.teamName,
    required this.teamLogo,
  });

  @override
  Widget build(BuildContext context) {
    List<Piloto>? pilotosDelEquipo = [
      equipo.pilotoCompleto1!,
      equipo.pilotoCompleto2!
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), 
              blurRadius: 10, 
              offset: const Offset(0, 4), 
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize
                  .min, 
              children: [
                BandaEquipo(
                    teamColor: teamColor,
                    teamName: teamName,
                    teamLogo: teamLogo),
                GestureDetector(
                  onTap: () {
                    context.push(
                      '/detailEquipo',
                      extra: {
                        'equipo': equipo,
                        'teamColor': teamColor,
                        'teamLogo': teamLogo,
                        'tag':equipo.id.toString()+"equipo"
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: teamColor,
                          width: 4),
                      borderRadius:
                          BorderRadius.circular(8)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Hero(
                            tag: equipo.id.toString()+"equipo",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  12), 
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: FadeInImage(
                                  fit: BoxFit
                                      .cover, 
                                  placeholder: const AssetImage(
                                      'assets/images/loading.gif'),
                                  image: (equipo.coche == null ||
                                          equipo.coche.isEmpty)
                                      ? const AssetImage(
                                              'assets/images/no-image.jpg')
                                          as ImageProvider
                                      : NetworkImage(equipo.coche),
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                        'assets/images/no-image.jpg',
                                        fit: BoxFit.cover);
                                  },
                                ),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ExpansionTile(
                  title: const Text(
                    "Pilotos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  initiallyExpanded: false,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Wrap(
                        spacing: 70, 
                        runSpacing: 10, 
                        alignment: WrapAlignment.center,
                        children: pilotosDelEquipo.isNotEmpty
                            ? pilotosDelEquipo
                                .map((piloto) => CardPilotosEquipos(
                                      piloto: piloto,
                                      teamColor: teamColor,
                                      teamLogo: teamLogo,
                                    ))
                                .toList()
                            : [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("No hay pilotos en este equipo."),
                                )
                              ],
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

class CardPilotosEquipos extends StatelessWidget {
  final Piloto piloto;
  final Color teamColor;
  final String teamLogo;
  CardPilotosEquipos({
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
            'tag':piloto.id.toString() + "Delequipo"
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: piloto.id.toString()+"Delequipo",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    12), 
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
          ],
        ),
      ),
    );
  }
}
