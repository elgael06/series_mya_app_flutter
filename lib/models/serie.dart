class Serie {
  int id;
  int idUsuario;
  String nombre;
  String portada;
  int capitulos;
  int tipo;
  String descripcion;
  bool estatus;

  Serie.toJson(Map dato) {
    id = dato['id'];
    idUsuario = dato['idUsuario'];
    nombre = dato['nombre'];
    portada = dato['portada'];
    capitulos = dato['capitulos'];
    tipo = dato['tipo'];
    descripcion = dato['descripcion'];
    estatus = dato['estatus'] == 'true';
  }
  toString() {
    return '$id  $nombre';
  }
}
