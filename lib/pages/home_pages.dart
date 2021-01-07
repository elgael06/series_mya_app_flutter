import 'package:flutter/material.dart';
import 'package:series_mya_app/blocs/series_bloc.dart';
import 'package:series_mya_app/models/serie.dart';
import 'package:series_mya_app/widgets/card_serie.dart';

class HomePage extends StatelessWidget {
  final series = SeriesBloc();

  HomePage();

  Future _refrescar() async {
    await series.cargarSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Series MYA'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: RefreshIndicator(
          onRefresh: () => _refrescar(),
          child: Container(
              color: Colors.black87,
              child: ListView(children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _title('Top series:'),
                    _listaSeries(series.seriesTop),
                    _title('Series:'),
                    _listaSeries(series.seriesAll),
                    _title('mis series:'),
                    _listaSeries(series.seriesMis),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      child: Text('mya-app.tech by elgael',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    )
                  ],
                )
              ]))),
    );
  }

  Widget _title(String title) => Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(top: 10, left: 10),
      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)));

  Widget _listaSeries(Stream<List<Serie>> stream) => Container(
        height: 220,
        child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<List<Serie>> snapshot) {
            var series = snapshot.data ?? [];
            return ListView.builder(
              padding: EdgeInsets.only(left: 5, right: 5),
              scrollDirection: Axis.horizontal,
              itemCount: series.length,
              itemBuilder: (_, i) => CardSerie(
                key: UniqueKey(),
                id: series[i].id,
                nombre: '${series[i].nombre}',
                url: '${series[i].portada}',
              ),
            );
          },
        ),
      );
}
