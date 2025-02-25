
import 'package:f1_app_final/models/piloto_model.dart';
import 'package:f1_app_final/models/user_model.dart';
import 'package:f1_app_final/presentation/widgets/banda_equipo_widget.dart';
import 'package:f1_app_final/providers/pilotos_provider.dart';
import 'package:f1_app_final/providers/user_provider.dart';
import 'package:f1_app_final/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PilotoListScreen extends StatelessWidget {
  const PilotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    PilotosProvider pilotosProvider = Provider.of<PilotosProvider>(context);
    User user = userProvider.user!;
     if (pilotosProvider.pilotos.isEmpty) {
      pilotosProvider.getAllPilotos(user.authToken);
     }

    return Scaffold(
      body: (pilotosProvider.pilotos.isEmpty)
          ? const Center(child: Image(image: AssetImage('assets/images/loading.gif'), height: 200,))
          : _PilotoListScreens(pilotos: pilotosProvider.pilotos),
    );
  }
}

class _PilotoListScreens extends StatelessWidget {
  final List<Piloto> pilotos;
  _PilotoListScreens({super.key, required this.pilotos});
  ThemePerson themePerson = ThemePerson();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (pilotos.length / 2).toInt(),
      itemBuilder: (context, index) {
        int actualIndex = index * 2; 
        return EquipoPilotosFila(
          teamColor: themePerson.equipoColores[index],
          teamName: themePerson.equiposNombre[index],
          teamLogo: themePerson.miniLogos[index],
          piloto1: pilotos[actualIndex],
          piloto2: pilotos[actualIndex + 1],
        );
      },
    );
  }
}

class EquipoPilotosFila extends StatelessWidget {
  final Piloto piloto1;
  final Piloto piloto2;
  final Color teamColor;
  final String teamName;
  final String teamLogo;

  EquipoPilotosFila({
    super.key,
    required this.teamColor,
    required this.teamName,
    required this.teamLogo,
    required this.piloto1,
    required this.piloto2,
  });

  @override
  Widget build(BuildContext context) {
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: teamColor,
                      width: 4),
                  borderRadius:
                      BorderRadius.circular(8), 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, 
                    children: [
                      CardPilotos(
                        piloto: piloto1,
                        teamColor: teamColor,
                        teamLogo: teamLogo,
                      ),
                      CardPilotos(
                        piloto: piloto2,
                        teamColor: teamColor,
                        teamLogo: teamLogo,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardPilotos extends StatelessWidget {
  final Piloto piloto;
  final Color teamColor;
  final String teamLogo;
  const CardPilotos({
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
            'tag':piloto.id.toString() + "piloto"
          },
        );
      },
      child: Card(
        color: const Color.fromARGB(255, 30, 30, 30),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16), 
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 40,
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: piloto.id.toString() + "piloto",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        12), 
                    child: SizedBox(
                      width: 100,
                      height: 100,
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
                const SizedBox(height: 12),
                Text(
                  piloto.nombre,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


