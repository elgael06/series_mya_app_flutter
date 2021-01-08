import 'package:flutter/material.dart';

class Serie {
  int id;
  int idUsuario;
  String nombre;
  String portada;
  int capitulos;
  int tipo;
  String descripcion;
  bool estatus;

  Serie(
      {@required this.id,
      @required this.nombre,
      @required this.portada,
      this.idUsuario = 0,
      this.capitulos = 0,
      this.descripcion = '',
      this.estatus = false,
      this.tipo = 0});

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

  toString() => '$id  $nombre';

  Map<String, dynamic> toMap() {
    return {'id': id, 'nombre': nombre, 'portada': portada};
  }
}
