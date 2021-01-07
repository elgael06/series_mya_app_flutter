import 'dart:async';

import 'package:series_mya_app/apis/optener_capitulos.dart';
import 'package:series_mya_app/models/capitulo.dart';

class CapitulosBloc {
  Stream<List<Capitulo>> get getCapitulos => _capitulos.stream;
  StreamController<List<Capitulo>> _capitulos =
      new StreamController<List<Capitulo>>();

  Future cargar(int idSerie) async {
    var datos = await OptenerCapitulos().getCapitulos(idSerie);
    _capitulos.add(datos);
  }

  CapitulosBloc() {
    _capitulos.add([]);
  }

  dispose() {
    _capitulos.close();
  }
}
