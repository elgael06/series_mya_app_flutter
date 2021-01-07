import 'package:flutter/material.dart';
import 'package:series_mya_app/blocs/series_bloc.dart';
import 'package:series_mya_app/models/serie.dart';
import 'package:series_mya_app/widgets/card_serie.dart';

class HomePage extends StatelessWidget {
  final series = SeriesBloc();

  HomePage();

  Future _refrescar() async {
    await Future.delayed(Duration(seconds: 2));
    print('Refrescar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Series MYA'),
      ),
      body: RefreshIndicator(
          onRefresh: () => _refrescar(),
          child: Container(
              margin: EdgeInsets.all(0),
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
                    _listaSeries(series.seriesTop),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('by elael',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white))
                      ],
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
        height: 190,
        child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<List<Serie>> snapshot) {
            var series = snapshot.data ?? [];
            return ListView.builder(
              padding: EdgeInsets.only(left: 5, right: 5),
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              itemCount: series.length,
              itemBuilder: (_, i) => CardSerie(
                nombre: '${series[i].nombre}',
                url: '${series[i].portada}',
              ),
            );
          },
        ),
      );
}
