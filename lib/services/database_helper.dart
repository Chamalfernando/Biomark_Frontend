// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../models/user.dart';

// class DatabaseHelper {
//   static const _databaseName = "BioMarkDB.db";
//   static const _databaseVersion = 1;
//   static const table = 'user_table';
//   static const columnId = '_id';
//   static const columnFirstName = 'firstName';
//   static const columnLastName = 'lastName';
//   static const columnFullName = 'fullName';
//   static const columnDob = 'dob';
//   static const columnEmail = 'email';
//   static const columnPassword = 'password';
//   static const columnMaidenName = 'MaidenName';
//   static const columnBestFriendName = 'ChildHoodFriend';
//   static const columnPetName = 'ChildHoodFriend';
//   static const columnCustomQuestion = 'CustomQuestion';
//   static const columnCustomAnswer = 'CustomAnswer';

//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;

//   Future<Database?> get database async {
//     if (_database != null) return _database;
//     _database = await _initDatabase(_databaseName);
//     return _database;
//   }

//   Future<Database> _initDatabase(String databaseName) async {
//     final path = join(await getDatabasesPath(), _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $table (
//         $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//         $columnFirstName TEXT NOT NULL,
//         $columnLastName TEXT NOT NULL,
//         $columnFullName TEXT NOT NULL,
//         $columnEmail TEXT NOT NULL,
//         $columnDob TEXT NOT NULL,
//         $columnPassword TEXT NOT NULL,
//         $columnMaidenName TEXT NOT NULL,
//         $columnBestFriendName TEXT NOT NULL,
//         $columnCustomQuestion TEXT NOT NULL,
//         $columnCustomAnswer TEXT NOT NULL
//       )
//       ''');
//   }

//   Future<int> insertUser(Map<String, dynamic> userData) async {
//     Database? db = await instance.database;
//     return await db!.insert(table, userData);
//   }

//   Future<User?> getUser(String email, String password) async {
//     Database? db = await instance.database;
//     List<Map<String, dynamic>> result = await db!.query(table,
//         where: "$columnEmail = ? AND $columnPassword = ?",
//         whereArgs: [email, password]);

//     if (result.isNotEmpty) {
//       return User(
//         firstName: result.first['firstName'],
//         lastName: result.first['lastName'],
//         fullName: result.first['fullName'],
//         dob: result.first['dob'],
//         email: result.first['email'],
//         password: result.first['password'],
//         maidenName: result.first['maidenName'],
//         bestFriendName: result.first['bestFriendName'],
//         petName: result.first['petName'],
//         customQuestion: result.first['customQuestion'],
//         customAnswer: result.first['customAnswer'],
//       );
//     }
//     return null;
//   }

//   Future close() async {
//     final db = await instance.database;
//     db?.close();
//   }
// }
