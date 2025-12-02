import 'package:easy_cocktail/core/constants/database_constants.dart';
import 'package:easy_cocktail/core/database/app_database.dart';
import 'package:easy_cocktail/data/local/cocktail_entity.dart';

class CocktailDao {
  Future<void> insert(CocktailEntity cocktail) async {
    final db = await AppDatabase().database;
    await db.insert(DatabaseConstants.cocktailsTable, cocktail.toMap());
  }

  Future<void> delete(String id) async {
    final db = await AppDatabase().database;
    await db.delete(
      DatabaseConstants.cocktailsTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Set<String>> getAllFavoriteIds() async {
    final db = await AppDatabase().database;
    final List maps = await db.query(DatabaseConstants.cocktailsTable);
    return maps.map((map) => map['id'] as String).toSet();
  }
}
