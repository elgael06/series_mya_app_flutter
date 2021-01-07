import 'package:flutter/material.dart';

Widget imagenFondo({String url, double h, double w}) => Positioned(
        child: Image(
      // placeholder: AssetImage('assets/img/loading2.gif'),
      image: NetworkImage(
        url,
      ),
      // fadeInDuration: Duration(milliseconds: 800),
      height: h,
      width: w,
      fit: BoxFit.fill,
    ));
