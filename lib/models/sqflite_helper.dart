import 'package:plant_store_app/models/user_repository.dart';
import 'package:sqflite/sqflite.dart';

class PlantHelper {
  static Database? _database;
  static PlantHelper? _plantHelper;

  PlantHelper._createInstance();

  factory PlantHelper() {
    _plantHelper ??= PlantHelper._createInstance();
    return _plantHelper!;
  }

  Future<Database?> get database async {
    // checking if a database exits or not. if not then initialize one, else
    // return the current initialized database
    print('came here for initialization');
    _database ??= await initializeDatabase();
    return _database;
  }

  //this will be first ran when a user logins.
  Future<Database> initializeDatabase() async {
    print('Started Initialization');

    var dir = await getDatabasesPath();
    var path = '$dir/plant_app.db';

    var database =
        await openDatabase(path, version: 2, onCreate: (db, version) {
          db.execute('''
      CREATE TABLE USERS(
      id integer primary key autoincrement,
      email text not null,
      password text not null
      )
    ''');
          db.execute('''
      CREATE TABLE FAVORITE(
      id integer primary key autoincrement,
      plantId integer not null
      )
    ''');
          db.execute('''
      CREATE TABLE RECENTVIEWED(
      id integer primary key autoincrement,
      plantId integer not null
      )
    ''');
          db.execute('''
      CREATE TABLE CARTPAGEITEM(
      id integer primary key autoincrement,
      plantId integer not null,
      quantity integer not null
      )
    ''');
    }, onUpgrade: (db, oldVersion, newVersion) {
      if (oldVersion < 2) {
        // Drop the existing table and recreate it
        db.execute('''
      CREATE TABLE USERS(
      id integer primary key autoincrement,
      email text not null,
      password text not null
      )
    ''');
        db.execute('''
      CREATE TABLE FAVORITE(
      id integer primary key autoincrement,
      plantId integer not null
      )
    ''');
        db.execute('''
      CREATE TABLE RECENTVIEWED(
      id integer primary key autoincrement,
      plantId integer not null
      )
    ''');
        db.execute('''
      CREATE TABLE CARTPAGEITEM(
      id integer primary key autoincrement,
      plantId integer not null,
      quantity integer not null
      )
    ''');
      }
    });

    print('Successfully initiated SQLite database');
    return database;
  }

  Future<bool> createUser(UserRepository user) async {
    var db = await database;
    print('Inserting about to be started');
    print('user = ${user.toJson()}');
    var result = await db!.insert("USERS", user.toJson());
    print(result);
    return true;
  }

  Future<UserRepository?> getUserByEmail(String email) async {
    var db = await database;
    var result =
        await db!.query("USERS", where: "email = ?", whereArgs: [email]);

    if (result.isNotEmpty) {
      return UserRepository.fromJson(result.first);
    } else {
      return null;
    }
  }
  Future<void> addToFavorites(int plantId) async {
    var db = await database;
    await db!.insert("FAVORITE", {"plantId": plantId});
  }

  Future<void> addToRecentViewed(int plantId) async {
    var db = await database;
    await db!.insert("RECENTVIEWED", {"plantId": plantId});
  }

  Future<List<int>> getFavoritePlants() async {
    var db = await database;
    var results = await db!.query("FAVORITE");
    return results.map<int>((row) => row['plantId'] as int).toList();
  }

  Future<List<int>> getRecentViewedPlants() async {
    var db = await database;
    var results = await db!.query("RECENTVIEWED");
    return results.map<int>((row) => row['plantId'] as int).toList();
  }

  Future<void> addToCart(int plantId, int quantity) async {
    var db = await database;
    await db!.insert("CARTPAGEITEM", {"plantId": plantId, "quantity": quantity});
  }

  Future<Map<int, int>> getCartItems() async {
    var db = await database;
    var results = await db!.query("CARTPAGEITEM");
    return { for (var row in results) row['plantId'] as int : row['quantity'] as int };
  }
}