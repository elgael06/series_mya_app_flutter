import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:series_mya_app/pages/home_pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          accentColor: Colors.blue,
          backgroundColor: Colors.green,
          primaryColor: Colors.black),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}
