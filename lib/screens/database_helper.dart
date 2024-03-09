import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  static final int _version = 2; // Updated version
  Future<List<Map<String, dynamic>>> queryAllGroups() async {
    final db = await instance.database;
    final result = await db.query('groups'); // Assuming 'groups' is your table name
    return result;
  }

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('splitbuddy.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: _version,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future _createDB(Database db, int version) async {
    // User Table
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL
    )
    ''');

    // Group Table (New)
    await db.execute('''
    CREATE TABLE groups (
      _id INTEGER PRIMARY KEY,
      Gname TEXT NOT NULL,
      currency TEXT NOT NULL,
      members TEXT NOT NULL
    )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE groups (
          _id INTEGER PRIMARY KEY,
          Gname TEXT NOT NULL,
          currency TEXT NOT NULL,
          members TEXT NOT NULL
        )
      ''');
    }
  }

  // Method to check if user exists and authenticate
  Future<bool> authenticateUser(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }

  // Method to check if an email already exists in the database
  Future<bool> emailExists(String email) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('users', row);
  }

  Future<int> insertGroup(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('groups', row);
  }

  // You can add more methods here as needed...

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
