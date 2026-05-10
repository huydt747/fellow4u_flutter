import 'dart:io' show File;
import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../database/database.dart';

class DbService {
  static final AppDatabase _db = AppDatabase(_openConnection());

  static AppDatabase get db => _db;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      if (kIsWeb) {
        // Placeholder for web database, or use in-memory for now
        // A real web implementation would use drift_web
        return NativeDatabase.memory();
      }
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }

  static Future<void> saveUser(Map<String, dynamic> userData) async {
    // ... logic to save user info locally
  }
}
