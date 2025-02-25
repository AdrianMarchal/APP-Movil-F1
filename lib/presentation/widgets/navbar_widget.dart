import 'package:f1_app_final/presentation/screens/equipo_list_screen.dart';
import 'package:f1_app_final/presentation/screens/home_screen.dart';
import 'package:f1_app_final/presentation/screens/piloto_list_screen.dart';
import 'package:flutter/material.dart';


class BottomTabbarExample extends StatefulWidget {
  final int initialIndex;

  const BottomTabbarExample({super.key, this.initialIndex = 1}); // Home por defecto

  @override
  State<BottomTabbarExample> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3, // Número de tabs
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              EquipoListScreen(), // Pantalla de Equipos
              HomeScreen(), // Pantalla de Inicio
              PilotoListScreen(), // Pantalla de Pilotos
            ],
          ),
        ),
        Material(
          color: const Color.fromARGB(255, 30, 30, 30), // Fondo oscuro
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.handyman_rounded), text: 'Equipos'),
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.sports_motorsports_rounded), text: 'Pilotos'),
            ],
            labelColor: const Color.fromARGB(255, 255, 1, 0), // Color del ícono y texto activo
            unselectedLabelColor: Colors.grey, // Color del ícono y texto inactivo
            indicatorColor: const Color.fromARGB(255, 255, 1, 0), // Indicador de pestaña activa
          ),
        ),
      ],
    );
  }
}
