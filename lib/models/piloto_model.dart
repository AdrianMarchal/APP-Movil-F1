// To parse this JSON data, do
//
//     final pilotosResponse = pilotosResponseFromJson(jsonString);

import 'dart:convert';

PilotosResponse pilotosResponseFromJson(String str) => PilotosResponse.fromJson(json.decode(str));


class PilotosResponse {
    List<Piloto> pilotos;

    PilotosResponse({
        required this.pilotos,
    });

    factory PilotosResponse.fromJson(Map<String, dynamic> json) => PilotosResponse(
        pilotos: List<Piloto>.from(json["pilotos"].map((x) => Piloto.fromJson(x))),
    );

}

class Piloto {
    int id;
    String nombre;
    String img;
    String nacionalidad;
    int edad;
    String fechaNacimiento;
    int carreras;
    int victorias;
    int podios;
    int poles;
    int campeonatosMundiales;
    String equipoActual;
    int numeroF1;
    String bandera;

    Piloto({
        required this.id,
        required this.nombre,
        required this.img,
        required this.nacionalidad,
        required this.edad,
        required this.fechaNacimiento,
        required this.carreras,
        required this.victorias,
        required this.podios,
        required this.poles,
        required this.campeonatosMundiales,
        required this.equipoActual,
        required this.numeroF1,
        required this.bandera
    });

    factory Piloto.fromJson(Map<String, dynamic> json) => Piloto(
        id: json["id"],
        nombre: json["nombre"],
        img: json["img"],
        nacionalidad: json["nacionalidad"],
        edad: json["edad"],
        fechaNacimiento: json["fechaNacimiento"],
        carreras: json["carreras"],
        victorias: json["victorias"],
        podios: json["podios"],
        poles: json["poles"],
        campeonatosMundiales: json["campeonatosMundiales"],
        equipoActual: json["equipoActual"],
        numeroF1: json["numeroF1"], 
        bandera: json["bandera"],
    );

    
}
