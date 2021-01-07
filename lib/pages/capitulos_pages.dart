import 'package:flutter/material.dart';

class CapitulosPage extends StatelessWidget {
  final String nombre;
  final String portada;
  final String tag;
  CapitulosPage({
    key,
    this.nombre = '',
    this.portada = '',
    this.tag = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Serie: $nombre')),
      body: Stack(children: [
        Hero(
          tag: tag,
          child: Positioned(
              child: Image(
            // placeholder: AssetImage('assets/img/loading2.gif'),
            image: NetworkImage(
              portada,
            ),
            fit: BoxFit.cover,
          )),
        ),
      ]),
    );
  }
}
