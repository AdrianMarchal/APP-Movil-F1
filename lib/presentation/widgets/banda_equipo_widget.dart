import 'package:flutter/material.dart';

class BandaEquipo extends StatelessWidget {
  final Color teamColor;
  final String teamName;
  final String teamLogo;

  const BandaEquipo({
    super.key,
    required this.teamColor,
    required this.teamName,
    required this.teamLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 40, // Altura de la banda
        child: Row(
          children: [
            // Contenedor con el color a la izquierda
            Container(
              width: 10,
              height: 20,
              color: teamColor,
            ),
            const SizedBox(width: 15),
            Text(
              teamName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Spacer(), // Para empujar el logo a la derecha
            // Logo del equipo a la derecha
            Image.network(
              teamLogo,
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}