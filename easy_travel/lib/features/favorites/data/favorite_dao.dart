import 'package:easy_travel/core/database/app_database.dart';
import 'package:easy_travel/shared/domain/destination.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDao {
  Future<void> insert(Destination destination) async {
    final Database database = await AppDatabase().database;
    await database.insert('destinations', destination.toMap());
  }

  Future<void> delete(int id) async {
    final Database database = await AppDatabase().database;
    await database.delete('destinations', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Destination>> fetchAll() async {
    final Database database = await AppDatabase().database;
    List<Map<String, dynamic>> maps = await database.query('destinations');
    return maps.map((map) => Destination.toDomain(map)).toList();
  }
}
