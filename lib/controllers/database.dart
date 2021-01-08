import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSeries {
  Database database;

  Future crear() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database.db');
    database =
        await openDatabase(path, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS favoritas(idSerie INTEGER)');
    }, version: 1);
  }

  Future agregarSeries(int idSerie) async {
    await crear();
    await database.transaction((txn) async {
      int id = await txn
          .rawInsert('INSERT INTO favoritas(idSerie) VALUES(?)', [idSerie]);
      print('Insert $id register...');
    });
    await database.close();
  }

  Future<List<Map>> listaSeries() async {
    List<Map> lista;
    await crear();
    await database.transaction((txn) async {
      lista = await txn.rawQuery(
        'SELECT * FROM favoritas',
      );
      print(lista);
    });
    await database.close();

    return lista;
  }

  Future removerSeries(int idSerie) async {
    await crear();
    await database.transaction((txn) async {
      int count = await txn
          .rawDelete('DELETE FROM favoritas WHERE idSerie=?', [idSerie]);
      print('delete $count registers.');
    });
    await database.close();
  }
}
