class Capitulo {
  int id;
  String url;
  String descripcion;
  int idSerie;

  Capitulo({this.id, this.descripcion, this.url, this.idSerie});

  Capitulo.toJson(Map dato) {
    id = dato['id'];
    url = dato['uri'];
    descripcion = dato['descripcion'];
    idSerie = dato['idSerie'];
  }

  Map<String, dynamic> toMaps() {
    return {
      'id': id,
      'url': url,
      'descripcion': descripcion,
      'idSerie': idSerie,
    };
  }
}
