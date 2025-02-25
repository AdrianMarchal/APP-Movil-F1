
import 'package:f1_app_final/models/noticias_model.dart';
import 'package:flutter/material.dart';

class NoticiasProvider with ChangeNotifier {
  List<Noticia> noticias = [];

  NoticiasProvider() {
    _cargarNoticias();
  }

  void _cargarNoticias() {
    noticias.addAll([
      Noticia(
        id: 1,
        titulo: "Las cosas que escondía Aston Martin... y enseña en Bahréin",
        img: "https://e00-xlk-ue-marca.uecdn.es/files/article_660_widen_webp/uploads/2025/02/24/67bc64ac47e43.webp",
        escritor: "EUGENIO MUÑOZ",
        lanzada: "24/02/2025",
        url: "https://www.marca.com/motor/formula1/2025/02/24/cosas-escondia-aston-martin-ensena-bahrein.html",
        cuerpo: """
Ya es más que un vídeo corto en redes sociales saliendo del box. Y más que un 'render' de una presentación a través de redes sociales, alejada de los interminables actos en los que se elogiaba a todo y todos. El Aston Martin AMR25 vive, rueda en la pista de Bahréin (lugar donde se disputarán los tres días de tests y la cuarta cita del Mundial tras Australia, China y Suzuka) y muestra su rugido en los kilómetros de 'filming day' -100 por piloto- que disponen Fernando Alonso y Lance Stroll antes de comenzar la campaña. Dicen poco, es evidente. Pero puede ilusionar.

Los cambios en el AMR25 son evidentes respecto a su predecesor y en pista ya enseñan más de la presentación en redes sociales. Empiezan desde los novedosos pontones, donde hay nueva refrigeración al cambiar su estructura. También se aprecia en el suelo, muy diferente al del AMR24. Cabe recordar que fue una de las partes que más quebraderos de cabeza reportó, llegando a devolver suelos desarrollados muchos meses atrás a carreras por su escaso rendimiento. Fue significativo aquel entrenamiento en México... con el suelo de Suzuka.

Ese era una misión a cambiar en el equipo británico. 'Aprendimos de lo que ocurrió en 2024 y el equipo lo utilizó como fuerza para llegar a esta temporada', explicó Fernando Alonso. También lo había dejado claro Andy Cowell, jefe de equipo: no volverían a perder el tiempo y para ello llegaron sus nuevas caras al mando. Desde Adrian Newey, que todavía no puede trabajar directamente pero todo dependerá de él, hasta el propio Cowell o Cardile en la gestión aerodinámica.

Hay más cambios en el AMR25. Uno de los aspectos más llamativos se aprecia en el cortísimo alerón delantero. Especialmente, hay dos elementos que copan focos. El flap del ala superior, de alta complejidad. Y la nariz pegada al primer elemento que la forma. Eso sí que se podía descubrir con las proyecciones de la presentación, aunque en pista se descubrirá si su concepto puede con los de McLaren, Ferrari o el de una Mercedes de la que se espera algún cambio mayor.

La siguiente parte será descubrir donde estará en pista. Ya dejó claro Fernando Alonso que no son temporadas como las de antaño y que los equipos pueden crecer hasta mitad de temporada. Los test no deberían ser tan importantes, algo que a muchos no les entra del todo en el razonamiento por todo lo vivido en el mágico inicio de 2023. Y más en el seno del equipo verde, donde Adrian Newey pisará fuerte. La base, de momento, promete. A Newey nadie le encasillará para trabajar centrado en el novedoso 2026 o pensando en el actual 2025, y tanto Cowell como Alonso han dejado claro que es un alma libre y se le debe dejar fluir.

Las carreras dirán qué esperar.
"""),
      Noticia(
        id: 2,
        titulo: "Ferrari sorprende en Bahréin con una evolución radical",
        img: "https://e00-xlk-ue-marca.uecdn.es/files/article_660_widen_webp/uploads/2025/02/20/67b751b635d1c.webp",
        escritor: "CARLOS MARTÍNEZ",
        lanzada: "24/02/2025",
        url: "https://autohebdosport.com/competicion/formula-1/asi-es-el-ferrari-sf-25-mas-carga-aerodinamica-y-una-nueva-suspension",
        cuerpo: """
El equipo Ferrari ha dejado boquiabiertos a los aficionados con una evolución radical en su monoplaza para la temporada 2025. Con un nuevo concepto aerodinámico y mejoras en la unidad de potencia, el SF-25 ha demostrado ser un coche mucho más estable en las curvas de baja velocidad.

Charles Leclerc y Carlos Sainz han completado las primeras vueltas en Bahréin y ya destacan la gran mejora en la tracción y la gestión de neumáticos. Se espera que Ferrari pelee con Red Bull y Mercedes desde la primera carrera.
"""),
      Noticia(
        id: 3,
        titulo: "Red Bull prueba un alerón revolucionario en los test de pretemporada",
        img: "https://img.redbull.com/images/c_crop,x_0,y_0,h_1992,w_3541/c_fill,w_1000,h_562/q_auto,f_auto/redbullcom/2025/2/19/nmne4twc9vogspzwwemc/red-bull-racing-rb21-galeria",
        escritor: "JUAN ANTONIO LÓPEZ",
        url: "https://www.thebestf1.es/el-ultimo-invento-revolucionario-de-red-bull-un-aleron-delantero-a-modo-de-difusor/#:~:text=Una%20novedad%20que%20posiblemente%20ha,función%20oculta%2C%20actuar%20como%20difusor.",
        lanzada: "24/02/2025",
        cuerpo: """
La escudería Red Bull ha sorprendido con un alerón trasero de diseño innovador durante los test en Bahréin. La nueva configuración, desarrollada bajo la supervisión de Adrian Newey, busca maximizar la carga aerodinámica sin comprometer la velocidad punta.

Max Verstappen y Sergio Pérez han destacado que el RB21 se siente más equilibrado y predecible en tandas largas, lo que podría darles una ventaja clave en la temporada. Ahora queda esperar si la FIA aprueba este concepto revolucionario.
"""),
      Noticia(
        id: 4,
        titulo: "Mercedes apuesta por un concepto agresivo en el W16",
        img: "https://e00-xlk-ue-marca.uecdn.es/files/article_660_widen_webp/uploads/2025/02/24/67bc82122c885.webp",
        escritor: "LUIS ÁLVAREZ",
        url: "https://formulaentinta.com/formula-1/ultimas-noticias/mercedes-w16/",
        lanzada: "24/02/2025",
        cuerpo: """
Después de varios años de altibajos, Mercedes ha decidido adoptar una filosofía de diseño más agresiva con el W16. El equipo de Brackley ha trabajado intensamente en la reducción del peso del chasis y en mejorar la eficiencia del flujo aerodinámico.

Lewis Hamilton y George Russell han completado las primeras pruebas con sensaciones positivas, aunque advierten que aún queda mucho trabajo por hacer antes de la primera carrera de la temporada en Australia.
"""),
      Noticia(
        id: 5,
        titulo: "McLaren sorprende con una solución aerodinámica innovadora",
        img: "https://f1grandprix.motorionline.com/wp-content/uploads/2025/02/norris-mclaren-mcl39-silverstone-test-f1-2025-1-1024x653.jpg.webp",
        escritor: "ANDRÉS GONZÁLEZ",
        url: "https://motociclismo.pt/es/cambios-innovadores-en-la-suspension-de-mclaren-una-estrategia-efectiva-contra-la-represion-de-elasticidad-aeroespacial-de-la-fia/",
        lanzada: "24/02/2025",
        cuerpo: """
McLaren ha llamado la atención en Bahréin con un innovador diseño en los pontones de su nuevo MCL38. Los ingenieros han desarrollado un sistema que mejora la refrigeración sin sacrificar la eficiencia aerodinámica.

Lando Norris y Oscar Piastri han elogiado el trabajo del equipo, destacando que el coche tiene una mayor estabilidad en curvas rápidas. La pregunta ahora es si McLaren podrá dar el salto definitivo para luchar de tú a tú con Red Bull y Ferrari.
"""),
      Noticia(
        id: 6,
        titulo: "Fernando Alonso destaca el progreso de Aston Martin en 2025",
        url: "https://www.marca.com/motor/formula1/2025/02/23/aston-martin-amr25-coche-volver-sonar-alonso.html",
        img: "https://e00-xlk-ue-marca.uecdn.es/files/article_660_widen_webp/uploads/2025/02/23/67bb5a104823e.webp",
        escritor: "JAVIER PÉREZ",
        lanzada: "24/02/2025",
        cuerpo: """
Fernando Alonso ha sido uno de los pilotos más optimistas tras las primeras pruebas del AMR25 en Bahréin. El asturiano ha resaltado la mejora en el equilibrio del coche y en la gestión de neumáticos, lo que podría darle a Aston Martin una base sólida para la temporada.

'Se nota el esfuerzo del equipo, hemos aprendido de 2024 y estamos mejor preparados', afirmó Alonso. Ahora, la clave será confirmar este progreso en las primeras carreras del año.
"""),
      Noticia(
        id: 7,
        titulo: "Haas se renueva con cambios clave en su estructura técnica",
        img: "https://motorcyclesports.net/wp-content/uploads/2025/01/2024122024-11-23T084209Z_737959903_MT1USATODAY24829970_RTRMADP_3_FORMULA-ONE-FORMULA-1-HEINEKEN-SILVER-LAS-VEGAS-GRAND-PRIX-2024-PRACTICE-AND-QUALIFYING-scaled-1-750x375.jpg",
        escritor: "MARCOS HIDALGO",
        url: "https://es.motorsport.com/f1/news/haas-cambios-primera-ingeniera-carrera/10690298/",
        lanzada: "24/02/2025",
        cuerpo: """
El equipo Haas ha decidido hacer una renovación completa en su estructura técnica para 2025, incorporando ingenieros con experiencia en equipos punteros. Con un coche que apuesta por la estabilidad y un mayor rendimiento en clasificación, el VF-25 busca dejar atrás los problemas del año pasado.

Nico Hülkenberg y Kevin Magnussen han señalado que el monoplaza es más predecible y fácil de pilotar, lo que podría traducirse en mejores resultados en la temporada.
"""),
      Noticia(
        id: 8,
        titulo: "Williams da un paso adelante con mejoras aerodinámicas clave",
        img: "https://campeones.com.ar/wp-content/uploads/2025/02/Captura-de-pantalla-2025-02-14-a-las-9.13.12%E2%80%AFp.-m.png",
        escritor: "ALEJANDRO FERNÁNDEZ",
        url: "https://es.motorsport.com/f1/news/nueva-suspension-williams-reducir-peso-mejorar-aerodinamica/10659092/",
        lanzada: "24/02/2025",
        cuerpo: """
Williams ha trabajado intensamente en mejorar su rendimiento aerodinámico para la temporada 2025. El nuevo FW47 incorpora elementos inspirados en los equipos punteros y ha mostrado un rendimiento prometedor en los test de Bahréin.

Alexander Albon y Logan Sargeant han destacado que el coche es más estable en condiciones de viento y que las simulaciones han sido muy positivas. El equipo británico busca consolidarse en la zona media de la parrilla y volver a pelear por puntos de manera constante.
"""),
    ]);
  }

  Future<List<Noticia>> buscarNoticias(String termino) async {
  return Future.delayed(Duration(milliseconds: 300), () {
    return noticias.where((noticia) {
      return noticia.titulo.toLowerCase().contains(termino.toLowerCase());
    }).toList();
  });
}
}
