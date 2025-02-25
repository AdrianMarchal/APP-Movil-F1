// To parse this JSON data, do
//
//     final circuitosResponse = circuitosResponseFromJson(jsonString);

import 'dart:convert';

CircuitosResponse circuitosResponseFromJson(String str) => CircuitosResponse.fromJson(json.decode(str));

String circuitosResponseToJson(CircuitosResponse data) => json.encode(data.toJson());

class CircuitosResponse {
    List<Circuito> circuitos;

    CircuitosResponse({
        required this.circuitos,
    });

    factory CircuitosResponse.fromJson(Map<String, dynamic> json) => CircuitosResponse(
        circuitos: List<Circuito>.from(json["circuitos"].map((x) => Circuito.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "circuitos": List<dynamic>.from(circuitos.map((x) => x.toJson())),
    };
}

class Circuito {
    int id;
    String lugar;
    String bandera;
    String dias;
    String mes;
    String nombrePremio;
    String img;
    String nombreCircuito;
    int primerGranPremio;
    int vueltas;
    int km;
    double kmGranPremio;
    String record;
    String nombrePiloto;
    int yearRecord;
    String imgCompleta;

    Circuito({
        required this.id,
        required this.lugar,
        required this.bandera,
        required this.dias,
        required this.mes,
        required this.nombrePremio,
        required this.img,
        required this.nombreCircuito,
        required this.primerGranPremio,
        required this.vueltas,
        required this.km,
        required this.kmGranPremio,
        required this.record,
        required this.nombrePiloto,
        required this.yearRecord,
        required this.imgCompleta,
    });

    factory Circuito.fromJson(Map<String, dynamic> json) => Circuito(
        id: json["id"],
        lugar: json["lugar"],
        bandera: json["bandera"],
        dias: json["dias"],
        mes: json["mes"],
        nombrePremio: json["nombrePremio"],
        img: json["img"],
        nombreCircuito: json["nombreCircuito"],
        primerGranPremio: json["primerGranPremio"],
        vueltas: json["vueltas"],
        km: json["km"],
        kmGranPremio: json["kmGranPremio"],
        record: json["record"],
        nombrePiloto: json["nombrePiloto"],
        yearRecord: json["yearRecord"],
        imgCompleta: json["imgCompleta"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lugar": lugar,
        "bandera": bandera,
        "dias": dias,
        "mes": mes,
        "nombrePremio": nombrePremio,
        "img": img,
        "nombreCircuito": nombreCircuito,
        "primerGranPremio": primerGranPremio,
        "vueltas": vueltas,
        "km": km,
        "kmGranPremio": kmGranPremio,
        "record": record,
        "nombrePiloto": nombrePiloto,
        "yearRecord": yearRecord,
        "imgCompleta": imgCompleta,
    };
}
