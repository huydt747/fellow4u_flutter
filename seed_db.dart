import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

void main() async {
  print('Creating news table and seeding...');

  final dbFile = File(p.join(Directory.current.path, 'db.sqlite'));
  final database = NativeDatabase(dbFile);

  try {
    final executor = await database.ensureOpen(_FakeQueryExecutorUser());

    // Create news table if not exists
    print('Creating news table...');
    await database.runCustom('''
      CREATE TABLE IF NOT EXISTS news (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        date TEXT NOT NULL,
        image_url TEXT NOT NULL
      )
    ''');

    // Seed News
    print('Seeding news...');
    final news = [
      {
        'title': 'New Destination in Danang City',
        'date': 'Feb 5, 2020',
        'imageUrl': 'img/scene/5.png',
      },
      {
        'title': '\$1 Flight Ticket',
        'date': 'Feb 5, 2020',
        'imageUrl': 'img/scene/6.png',
      },
      {
        'title': 'Visit Korea this Tet Holiday',
        'date': 'Jan 26, 2020',
        'imageUrl': 'img/scene/1.png',
      },
    ];

    for (final item in news) {
      await database.runInsert(
        '''
        INSERT OR REPLACE INTO news (title, date, image_url)
        VALUES (?, ?, ?)
      ''',
        [item['title'], item['date'], item['imageUrl']],
      );
    }

    print('News seeded successfully!');
  } catch (e) {
    print('Error seeding database: $e');
  } finally {
    await database.close();
  }
}

class _FakeQueryExecutorUser extends QueryExecutorUser {
  @override
  Future<void> beforeOpen(
    QueryExecutor executor,
    OpeningDetails details,
  ) async {}
  @override
  int get schemaVersion => 3;
}
