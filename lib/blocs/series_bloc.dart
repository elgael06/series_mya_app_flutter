import 'package:series_mya_app/apis/obtener_series.dart';
import 'package:series_mya_app/models/serie.dart';

class SeriesBloc {
  Stream<List<Serie>> get seriesTop async* {
    var datos = await OptenerSeries().getTopSeries();
    yield datos;
  }

  Stream<List<Serie>> get seriesAll async* {
    var datos = await OptenerSeries().getAllSeries();
    yield datos;
  }

  SeriesBloc() {
    OptenerSeries().getTopSeries();
  }
}
