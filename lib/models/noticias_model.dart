class Noticia {
  int id;
  String titulo;
  String img;
  String escritor;
  String lanzada;
  String cuerpo;
  String url;

  Noticia({
    required this.id,
    required this.titulo,
    required this.img,
    required this.escritor,
    required this.lanzada,
    required this.cuerpo,
    required this.url
  });



  @override
  String toString() {
    return 'Noticia(titulo: $titulo, escritor: $escritor, lanzada: $lanzada)';
  }
}
