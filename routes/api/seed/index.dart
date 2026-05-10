import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post && context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final db = context.read<AppDatabase>();

  // Use raw SQL to bypass out-of-sync generated code
  try {
    // Seed Languages
    await db.customStatement('INSERT OR IGNORE INTO languages (name) VALUES (?)', ['English']);
    await db.customStatement('INSERT OR IGNORE INTO languages (name) VALUES (?)', ['Vietnamese']);

    // Seed Guides
    final guides = [
      {
        'username': 'tuan.guide@example.com',
        'fullName': 'Tuan Tran',
        'city': 'Danang',
        'country': 'Vietnam',
        'activity_title': '2 Hour Bicycle Tour exploring Hoian',
        'activity_image_url': 'https://images.unsplash.com/photo-1528127269322-539801943592?q=80&w=1000',
        'avatar_url': 'img/avatar/1.png',
      },
      {
        'username': 'linh.guide@example.com',
        'fullName': 'Linh Hana',
        'city': 'Hanoi',
        'country': 'Vietnam',
        'activity_title': '1 day at Bana Hill',
        'activity_image_url': 'https://images.unsplash.com/photo-1559592413-7cea83781ce4?q=80&w=1000',
        'avatar_url': 'img/avatar/2.png',
      }
    ];

    for (final g in guides) {
      await db.customStatement('''
        INSERT OR REPLACE INTO users 
        (username, password_hash, role, full_name, city, country, activity_title, activity_image_url, avatar_url)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        g['username'], 'hashed_password', 'Guide', g['fullName'], 
        g['city'], g['country'], g['activity_title'], g['activity_image_url'], g['avatar_url']
      ]);
    }

    // Seed Trips for userId 1 (Traveler)
    final trips = [
      {
        'userId': 1,
        'title': 'Dragon Bridge Night Tour',
        'destination': 'Da Nang, Vietnam',
        'status': 'current',
        'startDate': '2020-01-30T13:00:00',
        'imageUrl': 'img/scene/1.png',
        'guideId': 2,
      },
      {
        'userId': 1,
        'title': 'Ho Guom Morning Walk',
        'destination': 'Hanoi, Vietnam',
        'status': 'next',
        'startDate': '2020-02-02T08:00:00',
        'imageUrl': 'img/scene/2.png',
        'guideId': 3,
      },
      {
        'userId': 1,
        'title': 'Ba Na Hills Adventure',
        'destination': 'Da Nang, Vietnam',
        'status': 'next',
        'startDate': '2020-02-10T07:00:00',
        'imageUrl': 'img/scene/3.png',
        'guideId': 2,
      },
      {
        'userId': 1,
        'title': 'Old Quarter Food Tour',
        'destination': 'Hanoi, Vietnam',
        'status': 'next',
        'startDate': '2020-02-15T18:00:00',
        'imageUrl': 'img/scene/4.png',
        'guideId': 3,
      },
      {
        'userId': 1,
        'title': 'Son Tra Peninsula Exploration',
        'destination': 'Da Nang, Vietnam',
        'status': 'next',
        'startDate': '2020-02-20T08:30:00',
        'imageUrl': 'img/scene/5.png',
        'guideId': 2,
      },
      {
        'userId': 1,
        'title': 'Temple of Literature Visit',
        'destination': 'Hanoi, Vietnam',
        'status': 'next',
        'startDate': '2020-02-25T09:00:00',
        'imageUrl': 'img/scene/6.png',
        'guideId': 3,
      },
      {
        'userId': 1,
        'title': 'Hoi An Ancient Town Night',
        'destination': 'Hoi An, Vietnam',
        'status': 'next',
        'startDate': '2020-03-01T17:00:00',
        'imageUrl': 'img/scene/1.png',
        'guideId': 2,
      },
      {
        'userId': 1,
        'title': 'Quoc Tu Giam Temple',
        'destination': 'Hanoi, Vietnam',
        'status': 'past',
        'startDate': '2020-01-20T09:00:00',
        'imageUrl': 'img/scene/2.png',
        'guideId': 3,
      }
    ];

    for (final t in trips) {
      await db.customStatement('''
        INSERT OR REPLACE INTO trips 
        (user_id, title, destination, status, start_date, image_url, guide_id)
        VALUES (?, ?, ?, ?, ?, ?, ?)
      ''', [
        t['userId'], t['title'], t['destination'], t['status'], 
        t['startDate'], t['imageUrl'], t['guideId']
      ]);
    }

    return Response.json(body: {'message': 'Seeded successfully via raw SQL'});
  } catch (e) {
    return Response.json(statusCode: 500, body: {'error': e.toString()});
  }
}
