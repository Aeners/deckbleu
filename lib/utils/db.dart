import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tablePlayers = 'Players';
final String columnId = '_id';
final String columnUsername = 'username';

// data model class
class Player {
  int id;
  String username;

  Player(username)
      : username = username[0].toUpperCase() + username.substring(1);

  // convenience constructor to create a Player object
  Player.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    username = map[columnUsername];
  }

  // convenience method to create a Map from this Player object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{columnUsername: username};
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "deckbleuDatabase.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  deleteEntireDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    await deleteDatabase(path);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tablePlayers (
                $columnId INTEGER PRIMARY KEY,
                $columnUsername TEXT NOT NULL
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(String username) async {
    Player player = Player(username);
    Database db = await database;
    int id = await db.insert(tablePlayers, player.toMap());
    return id;
  }

  Future<List<Player>> queryPlayerAll() async {
    Database db = await database;
    List<Map> maps = await db.rawQuery('SELECT * FROM $tablePlayers');
    if (maps.length > 0) {
      return maps.map((Map<String, dynamic> player) {
        return Player.fromMap(player);
      }).toList();
    }
    return null;
  }

  Future<Player> queryPlayerById(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tablePlayers,
        columns: [columnId, columnUsername],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Player.fromMap(maps.first);
    }
    return null;
  }

  Future<Player> queryPlayerByName(String username) async {
    Database db = await database;
    List<Map> maps = await db.query(tablePlayers,
        columns: [columnId, columnUsername],
        where: '$columnUsername = ?',
        whereArgs: [username]);
    if (maps.length > 0) {
      return Player.fromMap(maps.first);
    }
    return null;
  }

  Future<int> queryNumberOfPlayers() async {
    Database db = await database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tablePlayers'));
  }
}
