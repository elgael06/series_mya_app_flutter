class Capitulo {
  int id;
  String url;
  String descripcion;
  int idSerie;
  Capitulo.toJson(Map dato) {
    id = dato['id'];
    url = dato['uri'];
    descripcion = dato['descripcion'];
    idSerie = dato['idSerie'];
  }
}
