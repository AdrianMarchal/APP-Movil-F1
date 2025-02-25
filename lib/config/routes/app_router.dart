
import 'package:f1_app_final/models/circuitos_model.dart';
import 'package:f1_app_final/models/equipo_model.dart';
import 'package:f1_app_final/models/noticias_model.dart';
import 'package:f1_app_final/models/piloto_model.dart';
import 'package:f1_app_final/presentation/screens/circuito_details_screen.dart';
import 'package:f1_app_final/presentation/screens/equipo_detais_screen.dart';
import 'package:f1_app_final/presentation/screens/equipo_list_screen.dart';
import 'package:f1_app_final/presentation/screens/home_screen.dart';
import 'package:f1_app_final/presentation/screens/inicial_screen.dart';
import 'package:f1_app_final/presentation/screens/login_screen.dart';
import 'package:f1_app_final/presentation/screens/noticias_details.dart';
import 'package:f1_app_final/presentation/screens/perfil_screen.dart';
import 'package:f1_app_final/presentation/screens/piloto_datail_screen.dart';
import 'package:f1_app_final/presentation/screens/piloto_list_screen.dart';
import 'package:f1_app_final/presentation/screens/register_exitoso_screen.dart';
import 'package:f1_app_final/presentation/screens/register_screen.dart';
import 'package:f1_app_final/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: '/exito',
    builder: (context, state) => RegisterExitosoScreen(),
  ),
  GoRoute(
    path: '/inicial',
    builder: (context, state) => InicialScreen(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/listPilotos',
    builder: (context, state) => PilotoListScreen(),
  ),
  GoRoute(
    path: '/detailPilotos',
    builder: (context, state) {
      final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;

      final piloto = extra['piloto'] as Piloto;
      final teamColor = extra['teamColor'] as Color;
      final teamLogo = extra['teamLogo'] as String;
      final tag = extra['tag'] as String;

      return PilotoDatailScreen(
        piloto: piloto,
        teamColor: teamColor,
        teamLogo: teamLogo,
        tag: tag,
      );
    },
  ),
  GoRoute(
    path: '/listEquipos',
    builder: (context, state) => EquipoListScreen(),
  ),
  GoRoute(
  path: '/detailEquipo',
  builder: (context, state) {
    final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;

    final equipo = extra['equipo'] as Equipo;
    final teamColor = extra['teamColor'] as Color;
    final teamLogo = extra['teamLogo'] as String;
    final tag = extra['tag'] as String;

    return EquipoDetaisScreen(
      equipo: equipo,
      teamColor: teamColor,
      teamLogo: teamLogo,
      tag: tag,
    );
  },
),
GoRoute(
  path: '/detailCircuito',
  builder: (context, state) {
    print("Hola spy la ruta");
    final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
    print("Este es el extra");
    print(extra);
    final circuito = extra['circuito'] as Circuito;
    return CircuitoDetailsScreen(
      circuito: circuito,
    );
  },
),

GoRoute(
  path: '/detailNoticia',
  builder: (context, state) {
    final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
    final noticia = extra['noticia'] as Noticia;
    return NoticiasDetails(
      noticia: noticia,
    );
  },
),

 GoRoute(
    path: '/perfil',
    builder: (context, state) => PerfilScreen(),
  ),


]);
