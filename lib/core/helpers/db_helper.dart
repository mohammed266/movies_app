import '../../features/home/data/model/movie/movies_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'movies.db';
  static const _databaseVersion = 1;

  static const table = 'favorites';

  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnPosterPath = 'posterPath';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT NOT NULL,
        $columnPosterPath TEXT NOT NULL
      )
    ''');
  }

  // Insert a movie
  Future<void> insertFavorite(MovieDbModel movie) async {
    final db = await database;
    await db.insert(table, movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Delete a movie
  Future<void> deleteFavorite(int movieId) async {
    final db = await database;
    await db.delete(table, where: '$columnId = ?', whereArgs: [movieId]);
  }

  // Get all favorite movies
  Future<List<MovieDbModel>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return MovieDbModel.fromMap(maps[i]);
    });
  }
}
