import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:series_mya_app/pages/capitulos_pages.dart';
import 'package:series_mya_app/widgets/imagen_fondo.dart';

class CardSerie extends StatelessWidget {
  final int id;
  final String nombre;
  final String url;
  final int capitulos;
  final String descripcion;

  onpress() {
    print('$id $nombre');
  }

  CardSerie(
      {key,
      this.id = 0,
      this.nombre,
      this.url,
      this.capitulos = 0,
      this.descripcion = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: '$nombre $key',
        child: GestureDetector(
          child: Container(
            width: 120,
            child: Card(
              child: Stack(
                children: [
                  imagenFondo(url: url, h: 220, w: 120),
                  Column(
                    children: [
                      Container(
                        width: 220,
                        height: 32,
                        padding: EdgeInsets.only(top: 5, left: 2, right: 2),
                        color: Colors.black87,
                        child: Text(
                          nombre,
                          style: TextStyle(
                            color: Colors.blueGrey[100],
                            fontSize: 10,
                          ),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            onpress();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CapitulosPage(
                  nombre: this.nombre,
                  portada: url,
                  tag: '$nombre $key',
                ),
              ),
            );
          },
        ));
  }
}
