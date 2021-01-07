import 'dart:async';

import 'package:series_mya_app/apis/obtener_series.dart';
import 'package:series_mya_app/models/serie.dart';

class SeriesBloc {
  Stream<List<Serie>> get seriesTop => _top.stream;
  StreamController<List<Serie>> _top = new StreamController<List<Serie>>();

  Stream<List<Serie>> get seriesAll => _all.stream;
  StreamController<List<Serie>> _all = new StreamController<List<Serie>>();

  Stream<List<Serie>> get seriesMis => _mis.stream;
  StreamController<List<Serie>> _mis = new StreamController<List<Serie>>();

  Future cargarSeries() async {
    _top.add([]);
    _all.add([]);
    _mis.add([]);
    var top = await OptenerSeries().getTopSeries();
    _top.add(top);
    var all = await OptenerSeries().getAllSeries();
    _all.add(all);
    var mis = await OptenerSeries().getTopSeries();
    _mis.add(mis);
  }

  SeriesBloc() {
    cargarSeries();
  }
  dispose() {
    _top.close();
    _all.close();
    _mis.close();
  }
}
