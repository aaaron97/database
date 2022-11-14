import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin{
  Database? myDatabase;

  DBAdmin db = DBAdmin._();
  DBAdmin._();

  checkDatabase() async {
    if(myDatabase != null){
      return myDatabase;
    }
     myDatabase = await initDatabase();
    return myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "AgendaBD App");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database dbx, int version) async {
        await dbx.execute(
            "CREATE TABLE AgendaBD App(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descripcion TEXT, estado TEXT)");
      },
    );
  }
}

 