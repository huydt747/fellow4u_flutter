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
      },
      {
        'username': 'linh.guide@example.com',
        'fullName': 'Linh Hana',
        'city': 'Hanoi',
        'country': 'Vietnam',
        'activity_title': '1 day at Bana Hill',
        'activity_image_url': 'https://images.unsplash.com/photo-1559592413-7cea83781ce4?q=80&w=1000',
      }
    ];

    for (final g in guides) {
      await db.customStatement('''
        INSERT OR REPLACE INTO users 
        (username, password_hash, role, full_name, city, country, activity_title, activity_image_url)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        g['username'], 'hashed_password', 'Guide', g['fullName'], 
        g['city'], g['country'], g['activity_title'], g['activity_image_url']
      ]);
    }

    return Response.json(body: {'message': 'Seeded successfully via raw SQL'});
  } catch (e) {
    return Response.json(statusCode: 500, body: {'error': e.toString()});
  }
}
