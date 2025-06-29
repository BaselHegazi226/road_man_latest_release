// import 'package:path/path.dart'; // لحل مشكلة join
// import 'package:road_man_project/core/manager/user_learning_path_manager/user_learning_path_manager.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DBHelper {
//   static final DBHelper instance = DBHelper._init();
//   static Database? _database;
//
//   DBHelper._init();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('user_learning_path.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String fileName) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, fileName); // ✅ join من مكتبة path
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await UserLearningPathHelper.createLearningPathTables(db);
//       },
//     );
//   }
//
//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }
// }
