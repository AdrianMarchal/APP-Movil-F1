
import 'package:f1_app_final/models/circuitos_model.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CircuitoDetailsScreen extends StatelessWidget {
  Circuito circuito;
  CircuitoDetailsScreen({super.key, required this.circuito});

  @override
  Widget build(BuildContext context) {
    print(circuito);
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
          child: _CircuitoDetailsScreen(circuito: circuito)),
    );
  }
}

class _CircuitoDetailsScreen extends StatelessWidget {
  Circuito circuito;
  _CircuitoDetailsScreen({super.key, required this.circuito});

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
                  top: BorderSide(color: Color.fromARGB(255, 255, 1, 0), width: 7),
                  right: BorderSide(color: Color.fromARGB(255, 255, 1, 0), width: 0),
                  bottom: BorderSide(color: Color.fromARGB(255, 255, 1, 0), width: 0),
                  left: BorderSide(color: Color.fromARGB(255, 255, 1, 0), width: 7),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 65,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/images/loading.gif'),
                        image: (circuito.bandera.isNotEmpty)
                            ? NetworkImage(circuito.bandera) as ImageProvider
                            : const AssetImage('assets/images/no-image.jpg'),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/no-image.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              circuito.lugar,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Text(
                              " 2025",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Text(circuito.nombreCircuito,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black54))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  image: (circuito.imgCompleta.isEmpty)
                      ? const AssetImage('assets/images/no-image.jpg')
                          as ImageProvider
                      : NetworkImage(circuito.imgCompleta),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/no-image.jpg',
                      fit: BoxFit.cover,
                    );
                  },
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
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 255, 1, 0), width: 0),
                        right: BorderSide(
                            color: Color.fromARGB(255, 255, 1, 0), width: 7),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 255, 1, 0), width: 7),
                        left: BorderSide(color: Colors.transparent, width: 0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Longitud del Circuito",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              circuito.km.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                            const Text(
                              "  KM",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
          ShowUpAnimation(
            delayStart: const Duration(seconds: 0),
            animationDuration: const Duration(milliseconds: 750),
            curve: Curves.bounceIn,
            direction: Direction.horizontal,
            offset: 0.10,
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 25,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top:
                                BorderSide(color: Colors.transparent, width: 0),
                            right: BorderSide(color: Colors.grey, width: 3),
                            bottom: BorderSide(color: Colors.grey, width: 3),
                            left:
                                BorderSide(color: Colors.transparent, width: 0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Numero de vueltas",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                            Text(
                              circuito.vueltas.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    )),
                ShowUpAnimation(
                  delayStart: const Duration(seconds: 0),
                  animationDuration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceIn,
                  direction: Direction.horizontal,
                  offset: 0.10,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 25,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                  color: Colors.transparent, width: 0),
                              right: BorderSide(color: Colors.grey, width: 3),
                              bottom: BorderSide(color: Colors.grey, width: 3),
                              left: BorderSide(
                                  color: Colors.transparent, width: 0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Primer Gran Prix",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                              Text(
                                circuito.primerGranPremio.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          ShowUpAnimation(
            delayStart: const Duration(seconds: 0),
            animationDuration: const Duration(milliseconds: 1250),
            curve: Curves.bounceIn,
            direction: Direction.horizontal,
            offset: 0.10,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
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
                        const Text(
                          "Distancia de la carrera",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              circuito.kmGranPremio.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                            const Text(
                              "  KM",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ),
          ShowUpAnimation(
            delayStart: const Duration(seconds: 0),
            animationDuration: const Duration(milliseconds: 1500),
            curve: Curves.bounceIn,
            direction: Direction.horizontal,
            offset: 0.10,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(8),
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
                        const Text(
                          "Mejor vuelta",
                          style: TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                        Text(
                          circuito.record.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                        Text(
                          "${circuito.nombrePiloto} [${circuito.yearRecord}]",
                          style: const TextStyle(color: Colors.black87, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
