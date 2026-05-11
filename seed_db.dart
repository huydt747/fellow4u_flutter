import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

void main() async {
  print('Seeding database via seed_db.dart...');

  final dbFile = File(p.join(Directory.current.path, 'db.sqlite'));
  final database = NativeDatabase(dbFile);

  try {
    await database.ensureOpen(_FakeQueryExecutorUser());
    
    // Clear existing data
    print('Cleaning up old data...');
    final tables = ['messages', 'conversations', 'trips', 'tours', 'user_languages', 'languages', 'fees', 'availability', 'news', 'users'];
    for (final table in tables) {
      try {
        await database.runCustom('DELETE FROM $table');
      } catch (e) {
        print('Warning: Could not delete from $table: $e');
      }
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
        'INSERT INTO news (title, date, image_url) VALUES (?, ?, ?)',
        [item['title'], item['date'], item['image_url']],
      );
    }

    // Seed Users
    print('Seeding users...');
    String hashPassword(String password) => sha256.convert(utf8.encode(password)).toString();
    final hashedPass = hashPassword('123');

    // ID 1: Traveler
    await database.runInsert('''
      INSERT INTO users (id, username, password_hash, role, full_name, city, country, avatar_url, bio)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [1, 'test@mail.com', hashedPass, 'Traveler', 'Test User', 'Danang', 'Vietnam', 'img/avatar/6.png', 'I love traveling!']);

    // ID 2: Guide
    await database.runInsert('''
      INSERT INTO users (id, username, password_hash, role, full_name, city, country, avatar_url, bio, rating, review_count)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [2, 'tuan.guide@mail.com', hashedPass, 'Guide', 'Tuan Tran', 'Danang', 'Vietnam', 'img/avatar/1.png', 'Professional guide with 5 years experience.', 4.8, 120]);

    // ID 3: Guide
    await database.runInsert('''
      INSERT INTO users (id, username, password_hash, role, full_name, city, country, avatar_url, bio, rating, review_count)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [3, 'linh.guide@mail.com', hashedPass, 'Guide', 'Linh Hana', 'Hanoi', 'Vietnam', 'img/avatar/2.png', 'Expert in local food and culture.', 4.9, 85]);

    // ID 4: Traveler
    await database.runInsert('''
      INSERT INTO users (id, username, password_hash, role, full_name, city, country, avatar_url)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''', [4, 'emily@mail.com', hashedPass, 'Traveler', 'Emily Watson', 'London', 'UK', 'img/avatar/3.png']);

    // Seed Languages
    print('Seeding languages...');
    await database.runInsert('INSERT INTO languages (id, name) VALUES (?, ?)', [1, 'English']);
    await database.runInsert('INSERT INTO languages (id, name) VALUES (?, ?)', [2, 'Vietnamese']);
    await database.runInsert('INSERT INTO languages (id, name) VALUES (?, ?)', [3, 'French']);

    // Seed User Languages
    print('Seeding user languages...');
    // Tuan (ID 2) speaks English and Vietnamese
    await database.runInsert('INSERT INTO user_languages (user_id, language_id) VALUES (?, ?)', [2, 1]);
    await database.runInsert('INSERT INTO user_languages (user_id, language_id) VALUES (?, ?)', [2, 2]);
    // Linh (ID 3) speaks Vietnamese and French
    await database.runInsert('INSERT INTO user_languages (user_id, language_id) VALUES (?, ?)', [3, 2]);
    await database.runInsert('INSERT INTO user_languages (user_id, language_id) VALUES (?, ?)', [3, 3]);
    // Test User (ID 1) speaks English and Vietnamese
    await database.runInsert('INSERT INTO user_languages (user_id, language_id) VALUES (?, ?)', [1, 1]);
    await database.runInsert('INSERT INTO user_languages (user_id, language_id) VALUES (?, ?)', [1, 2]);

    // Seed Tours
    print('Seeding tours...');
    final tourData = [
      {'title': 'Dragon Bridge Night Tour', 'location': 'Da Nang, Vietnam', 'price': 25.0, 'rating': 4.5, 'image_url': 'img/scene/1.png', 'guide_id': 2, 'date': 'Feb 5, 2020', 'duration': '3 hours', 'likes': 120},
      {'title': 'Ho Guom Morning Walk', 'location': 'Hanoi, Vietnam', 'price': 15.0, 'rating': 4.8, 'image_url': 'img/scene/2.png', 'guide_id': 3, 'date': 'Feb 6, 2020', 'duration': '2 hours', 'likes': 85},
      {'title': 'Ba Na Hills Adventure', 'location': 'Da Nang, Vietnam', 'price': 50.0, 'rating': 4.7, 'image_url': 'img/scene/3.png', 'guide_id': 2, 'date': 'Feb 7, 2020', 'duration': '8 hours', 'likes': 210},
      {'title': 'Old Quarter Food Tour', 'location': 'Hanoi, Vietnam', 'price': 30.0, 'rating': 4.9, 'image_url': 'img/scene/4.png', 'guide_id': 3, 'date': 'Feb 8, 2020', 'duration': '4 hours', 'likes': 150},
    ];

    for (final tour in tourData) {
      await database.runInsert('''
        INSERT INTO tours (title, location, price, rating, image_url, guide_id, date, duration, likes)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [tour['title'], tour['location'], tour['price'], tour['rating'], tour['image_url'], tour['guide_id'], tour['date'], tour['duration'], tour['likes']]);
    }

    // Seed Trips for User 1
    print('Seeding trips for user 1...');
    final tripData = [
      {'title': 'My Da Nang Trip', 'destination': 'Da Nang, Vietnam', 'status': 'current', 'start_date': DateTime(2024, 5, 10).millisecondsSinceEpoch ~/ 1000, 'image_url': 'img/scene/1.png', 'guide_id': 2},
      {'title': 'Next Hanoi Adventure', 'destination': 'Hanoi, Vietnam', 'status': 'next', 'start_date': DateTime(2024, 6, 15).millisecondsSinceEpoch ~/ 1000, 'image_url': 'img/scene/2.png', 'guide_id': 3},
      {'title': 'Last Summer in Hue', 'destination': 'Hue, Vietnam', 'status': 'past', 'start_date': DateTime(2023, 7, 20).millisecondsSinceEpoch ~/ 1000, 'image_url': 'img/scene/5.png', 'guide_id': 2},
    ];

    for (final trip in tripData) {
      await database.runInsert('''
        INSERT INTO trips (user_id, title, destination, status, start_date, image_url, guide_id)
        VALUES (?, ?, ?, ?, ?, ?, ?)
      ''', [1, trip['title'], trip['destination'], trip['status'], trip['start_date'], trip['image_url'], trip['guide_id']]);
    }

    // Seed some Conversations and Messages
    print('Seeding chat...');
    // Conversation between User 1 and Guide 2
    final convId = await database.runInsert('''
      INSERT INTO conversations (user1_id, user2_id) VALUES (?, ?)
    ''', [1, 2]);

    await database.runInsert('''
      INSERT INTO messages (conversation_id, sender_id, content, timestamp)
      VALUES (?, ?, ?, ?)
    ''', [convId, 2, 'Hello! I am ready for our Dragon Bridge tour tonight.', DateTime.now().subtract(Duration(hours: 2)).millisecondsSinceEpoch ~/ 1000]);

    await database.runInsert('''
      INSERT INTO messages (conversation_id, sender_id, content, timestamp)
      VALUES (?, ?, ?, ?)
    ''', [convId, 1, 'Great! See you at 7 PM.', DateTime.now().subtract(Duration(minutes: 30)).millisecondsSinceEpoch ~/ 1000]);

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
  int get schemaVersion => 4;
}
