import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase _instance = AppDatabase._();

  factory AppDatabase() {
    return _instance;
  }

  Database? _database;

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'easy_travel.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''create table destinations 
      (id integer primary key,
        title text,
        poster_path text,
        overview text
      )
      ''');
      },
    );
  }

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }
}
