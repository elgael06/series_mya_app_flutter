import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:series_mya_app/blocs/capitulos_bloc.dart';
import 'package:series_mya_app/models/capitulo.dart';

class CapitulosPage extends StatelessWidget {
  final String nombre;
  final String portada;
  final String tag;
  final _controller = CapitulosBloc();

  CapitulosPage({
    key,
    id = 0,
    this.nombre = '',
    this.portada = '',
    this.tag = '',
  }) : super(key: key) {
    _controller.cargar(id);
  }

  showGoogleVideo(String url, BuildContext context) {
    InAppWebViewController webView;
    print(url);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InAppWebView(
                  initialUrl: url,
                  initialHeaders: {},
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      debuggingEnabled: true,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                  },
                  onLoadStart:
                      (InAppWebViewController controller, String url) {},
                  onLoadStop:
                      (InAppWebViewController controller, String url) {},
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: tag, child: Text('$nombre')),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              portada,
            ),
            fit: BoxFit.cover,
          )),
          child: StreamBuilder(
              stream: _controller.getCapitulos,
              builder: (context, AsyncSnapshot<List<Capitulo>> snapshot) {
                var capitulos = snapshot.data ?? [];
                return capitulos.length > 0
                    ? ListView.builder(
                        itemCount: snapshot.data.length ?? 1,
                        itemBuilder: (context, index) => ListTile(
                          title: GestureDetector(
                            onTap: () {
                              print('capitulo ${capitulos[index].descripcion}');
                              showGoogleVideo(capitulos[index].url, context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.black45,
                              height: 60,
                              child: Center(
                                child: Text(
                                  'capitulo ${capitulos[index].descripcion}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              color: Colors.black38,
                              margin: EdgeInsets.all(30),
                              child: Text(
                                'Cargando...',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      );
              })),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_play),
        onPressed: null,
        backgroundColor: Colors.pink,
      ),
    );
  }
}
