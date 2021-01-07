import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:series_mya_app/constants/urls.dart';
import 'package:series_mya_app/models/capitulo.dart';

class OptenerCapitulos {
  Future<List<Capitulo>> getCapitulos(int idSerie) async {
    List<Capitulo> lista = [];
    var response = await http.get('$capitulos=$idSerie');
    var jsonFormat = json.decode(response.body);
    for (var a in jsonFormat) {
      var serie = Capitulo.toJson(a);
      lista.add(serie);
    }
    return lista;
  }
}
