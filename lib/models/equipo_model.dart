// To parse this JSON data, do
//
//     final pilotosResponse = pilotosResponseFromJson(jsonString);

import 'dart:convert';

import 'package:f1_app_final/models/piloto_model.dart';



EquipoResponse equipoResponseFromJson(String str) => EquipoResponse.fromJson(json.decode(str));

String equipoResponseToJson(EquipoResponse data) => json.encode(data.toJson());

class EquipoResponse {
    List<Equipo> equipos;

    EquipoResponse({
        required this.equipos,
    });

    factory EquipoResponse.fromJson(Map<String, dynamic> json) => EquipoResponse(
        equipos: List<Equipo>.from(json["equipos"].map((x) => Equipo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "equipos": List<dynamic>.from(equipos.map((x) => x.toJson())),
    };
}

class Equipo {
    int id;
    String nombreCompleto;
    String alias;
    String sede;
    String motor;
    String chasis;
    int campeonatosConstructores;
    String piloto1;
    String piloto2;
    String img;
    String coche;
    String bandera;
    Piloto? pilotoCompleto1;
    Piloto? pilotoCompleto2;

    Equipo({
        required this.id,
        required this.nombreCompleto,
        required this.alias,
        required this.sede,
        required this.motor,
        required this.chasis,
        required this.campeonatosConstructores,
        required this.piloto1,
        required this.piloto2,
        required this.img,
        required this.coche,
        required this.bandera,
        this.pilotoCompleto1,
        this.pilotoCompleto2,
    });

    factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
        id: json["id"],
        nombreCompleto: json["nombreCompleto"],
        alias: json["alias"],
        sede: json["sede"],
        motor: json["motor"],
        chasis: json["chasis"],
        campeonatosConstructores: json["campeonatosConstructores"],
        piloto1: json["piloto1"],
        piloto2: json["piloto2"],
        img: json["img"],
        coche: json["coche"],
        bandera: json["bandera"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombreCompleto": nombreCompleto,
        "alias": alias,
        "sede": sede,
        "motor": motor,
        "chasis": chasis,
        "campeonatosConstructores": campeonatosConstructores,
        "piloto1": piloto1,
        "piloto2": piloto2,
        "img": img,
        "coche": coche,
    };
}
