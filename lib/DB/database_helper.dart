import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'my_table';

  static const loginId = '_id';
  static const accessToken = 'access_token';
  static const userId = 'user_id';
  static const userEmail = 'user_email';
  static const userMobile = 'user_mobile';
  static const isLogIn = 'is_login';
  static const updatedAt = 'updated_at';
  static const createdAt = 'created_at';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $loginId INTEGER PRIMARY KEY,
            $accessToken TEXT,
            $userId VARCHAR(10) NOT NULL,
            $userEmail VARCHAR(50),
            $userMobile VARCHAR(10),
            $isLogIn INTEGER NOT NULL,
            $updatedAt DATETIME NOT NULL,
            $createdAt DATETIME NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(String keyName, Map<String, dynamic> row) async {
    int id = row[keyName];
    return await _db.update(
      table,
      row,
      where: '$keyName = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(String keyName, dynamic id) async {
    return await _db.delete(
      table,
      where: '$keyName = ?',
      whereArgs: [id],
    );
  }
}
