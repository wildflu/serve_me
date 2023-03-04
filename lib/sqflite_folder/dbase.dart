
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Litedb {

  static Database? _db;

  Future<Database?> get db async {
      if(_db == null) {
        _db = await intialdb();
        return _db;
      }else {
        return _db;
      }
  }

  intialdb() async {
    String dbpath = await getDatabasesPath();
    String fullpath = join(dbpath, 'serveme.db');

    Database mydatab = await openDatabase(fullpath, onCreate: _onCreate, version: 4, onUpgrade: _onUpgrade);

    return mydatab;
  }

  _onUpgrade(Database db, int oldver, int newver) {
    print("upgrade");
  }

  _onCreate(Database db, int vers) async {
    await db.execute(
      '''
      CREATE TABLE "foods" 
        (
          "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          "name" TEXT NOT NULL,
          "imgfood" TEXT NOT NULL
        )
    ''');
    print("db created ----------------- done --------------");
  }

  // ------------- Shortcuts Methods

    // SELECT
  read(String sql)async {
    Database? mydb = await db ;
    List<Map> response = await mydb!.query(sql);
    return response   ;
  }
  //INSERT
  insert(String sql, Map<String, Object?> values)async {
    Database? mydb = await db ;
    int response = await mydb!.insert(sql, values);
    return response   ;
  }

  //update
  update(String sql, Map<String, Object?> values, String where)async {
    Database? mydb = await db ;
    int response = await mydb!.update(sql, values, where: where );
    return response   ;
  }
    //delete
  delete(String sql, String where)async {
    Database? mydb = await db ;
    int response = await mydb!.delete(sql, where: where,);
    return response ;
  }


}