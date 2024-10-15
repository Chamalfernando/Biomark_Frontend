import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final _databaseName = "BioMarkDB.db";
  static final _databaseVersion = 1;

  static final table = 'user_table';

  static final columnId = '_id';
  static final columnName = 'fullName';
  static final columnDob = 'dob';
  static final columnEmail = 'email';
  static final columnPassword = 'password';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnDob TEXT NOT NULL,
        $columnEmail TEXT NOT NULL,
        $columnPassword TEXT NOT NULL
      )
      ''');
  }

  Future<int> insertUser(User user) async {
    Database? db = await instance.database;
    return await db!.insert(table, user.toMap());
  }

  Future<User?> getUser(String email, String password) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> result = await db!.query(table,
        where: "$columnEmail = ? AND $columnPassword = ?",
        whereArgs: [email, password]);

    if (result.isNotEmpty) {
      return User(
        fullName: result.first['fullName'],
        dob: result.first['dob'],
        email: result.first['email'],
        password: result.first['password'],
        mothersMaidenName: result.first['mothersMaidenName'],
        childhoodFriend: result.first['childhoodFriend'],
        petName: result.first['petName'],
        customQuestion: result.first['customQuestion'],
      );
    }
    return null;
  }
}
