import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:series_mya_app/widgets/imagen_fondo.dart';

class CardSerie extends StatelessWidget {
  String nombre;
  String url;
  CardSerie({key, this.nombre, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: nombre,
      child: Container(
        width: 120,
        child: Card(
          child: Stack(
            children: [
              imagenFondo(url: url, h: 190, w: 120),
              Column(
                children: [
                  Container(
                    width: 170,
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
    );
  }
}
