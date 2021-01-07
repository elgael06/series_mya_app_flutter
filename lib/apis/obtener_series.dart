import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:series_mya_app/constants/urls.dart';
import 'package:series_mya_app/models/serie.dart';

class OptenerSeries {
  Future<List<Serie>> getTopSeries() async {
    List<Serie> lista = [];
    print(series['top_series'].toString());
    var response = await http.get('${series['top_series']}5');
    var jsonFormat = json.decode(response.body);
    for (var a in jsonFormat) {
      var serie = Serie.toJson(a);
      lista.add(serie);
    }
    return lista;
  }

  Future<List<Serie>> getAllSeries() async {
    List<Serie> lista = [];
    print(series['all_series'].toString());
    var response = await http.get('${series['all_series']}');
    var jsonFormat = json.decode(response.body);
    for (var a in jsonFormat) {
      var serie = Serie.toJson(a);
      lista.add(serie);
    }
    return lista;
  }
}
