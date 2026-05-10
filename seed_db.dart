import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

void main() async {
  print('Seeding database via seed_db.dart...');

  final dbFile = File(p.join(Directory.current.path, 'db.sqlite'));
  final database = NativeDatabase(dbFile);

  try {
    final executor = await database.ensureOpen(_FakeQueryExecutorUser());

    // Ensure guide_id column exists in trips table
    try {
      await database.runCustom('ALTER TABLE trips ADD COLUMN guide_id INTEGER');
    } catch (e) {
      // Column might already exist, ignore error
    }

    // Seed News
    print('Seeding news...');
    final news = [
      {'title': 'New Destination in Danang City', 'date': 'Feb 5, 2020', 'image_url': 'img/scene/5.png'},
      {'title': '\$1 Flight Ticket', 'date': 'Feb 5, 2020', 'image_url': 'img/scene/6.png'},
      {'title': 'Visit Korea this Tet Holiday', 'date': 'Jan 26, 2020', 'image_url': 'img/scene/1.png'},
    ];

    for (final item in news) {
      await database.runInsert(
        'INSERT OR REPLACE INTO news (title, date, image_url) VALUES (?, ?, ?)',
        [item['title'], item['date'], item['image_url']],
      );
    }

    // Seed Users (Guides)
    print('Seeding users...');
    final guides = [
      {
        'username': 'tuan.guide@example.com',
        'fullName': 'Tuan Tran',
        'city': 'Danang',
        'country': 'Vietnam',
        'activity_title': '2 Hour Bicycle Tour exploring Hoian',
        'activity_image_url': 'img/scene/1.png',
        'avatar_url': 'img/avatar/1.png',
      },
      {
        'username': 'linh.guide@example.com',
        'fullName': 'Linh Hana',
        'city': 'Hanoi',
        'country': 'Vietnam',
        'activity_title': '1 day at Bana Hill',
        'activity_image_url': 'img/scene/2.png',
        'avatar_url': 'img/avatar/2.png',
      }
    ];

    for (final g in guides) {
      await database.runInsert('''
        INSERT OR REPLACE INTO users 
        (username, password_hash, role, full_name, city, country, activity_title, activity_image_url, avatar_url)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        g['username'], 'hashed_password', 'Guide', g['fullName'], 
        g['city'], g['country'], g['activity_title'], g['activity_image_url'], g['avatar_url']
      ]);
    }

    // Seed Trips for userId 1
    print('Seeding trips...');
    final trips = [
      {'userId': 1, 'title': 'Dragon Bridge Night Tour', 'destination': 'Da Nang, Vietnam', 'status': 'current', 'startDate': '2020-01-30T13:00:00', 'imageUrl': 'img/scene/1.png', 'guideId': 2},
      {'userId': 1, 'title': 'Ho Guom Morning Walk', 'destination': 'Hanoi, Vietnam', 'status': 'next', 'startDate': '2020-02-02T08:00:00', 'imageUrl': 'img/scene/2.png', 'guideId': 3},
      {'userId': 1, 'title': 'Ba Na Hills Adventure', 'destination': 'Da Nang, Vietnam', 'status': 'next', 'startDate': '2020-02-10T07:00:00', 'imageUrl': 'img/scene/3.png', 'guideId': 2},
      {'userId': 1, 'title': 'Old Quarter Food Tour', 'destination': 'Hanoi, Vietnam', 'status': 'next', 'startDate': '2020-02-15T18:00:00', 'imageUrl': 'img/scene/4.png', 'guideId': 3},
      {'userId': 1, 'title': 'Son Tra Peninsula Exploration', 'destination': 'Da Nang, Vietnam', 'status': 'next', 'startDate': '2020-02-20T08:30:00', 'imageUrl': 'img/scene/5.png', 'guideId': 2},
      {'userId': 1, 'title': 'Temple of Literature Visit', 'destination': 'Hanoi, Vietnam', 'status': 'next', 'startDate': '2020-02-25T09:00:00', 'imageUrl': 'img/scene/6.png', 'guideId': 3},
      {'userId': 1, 'title': 'Hoi An Ancient Town Night', 'destination': 'Hoi An, Vietnam', 'status': 'next', 'startDate': '2020-03-01T17:00:00', 'imageUrl': 'img/scene/1.png', 'guideId': 2},
      {'userId': 1, 'title': 'Quoc Tu Giam Temple', 'destination': 'Hanoi, Vietnam', 'status': 'past', 'startDate': '2020-01-20T09:00:00', 'imageUrl': 'img/scene/2.png', 'guideId': 3}
    ];

    for (final t in trips) {
      await database.runInsert('''
        INSERT OR REPLACE INTO trips 
        (user_id, title, destination, status, start_date, image_url, guide_id)
        VALUES (?, ?, ?, ?, ?, ?, ?)
      ''', [
        t['userId'], t['title'], t['destination'], t['status'], 
        t['startDate'], t['imageUrl'], t['guideId']
      ]);
    }

    print('Database seeded successfully!');
  } catch (e) {
    print('Error seeding database: $e');
  } finally {
    await database.close();
  }
}

class _FakeQueryExecutorUser extends QueryExecutorUser {
  @override
  Future<void> beforeOpen(QueryExecutor executor, OpeningDetails details) async {}
  @override
  int get schemaVersion => 3;
}
