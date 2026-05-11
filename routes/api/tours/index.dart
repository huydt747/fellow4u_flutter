import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final db = context.read<AppDatabase>();

  // Use customSelect to bypass out-of-sync generated code and perform join
  try {
    final rows = await db.customSelect('''
      SELECT 
        t.*, 
        u.full_name as guide_name, 
        u.avatar_url as guide_avatar,
        u.city as guide_city,
        u.country as guide_country
      FROM tours t
      LEFT JOIN users u ON t.guide_id = u.id
    ''').get();

    final tourList = rows
        .map(
          (row) => {
            'id': row.read<int>('id'),
            'title': row.read<String>('title'),
            'location': row.readNullable<String>('location'),
            'price': row.read<double>('price'),
            'rating': row.read<double>('rating'),
            'imageUrl': row.readNullable<String>('image_url'),
            'date': row.readNullable<String>('date'),
            'duration': row.readNullable<String>('duration'),
            'likes': row.read<int>('likes'),
            'guideId': row.read<int>('guide_id'),
            'guide': {
              'fullName': row.readNullable<String>('guide_name'),
              'avatarUrl': row.readNullable<String>('guide_avatar'),
              'city': row.readNullable<String>('guide_city'),
              'country': row.readNullable<String>('guide_country'),
            }
          },
        )
        .toList();

    return Response.json(body: tourList);
  } catch (e) {
    return Response.json(statusCode: 500, body: {'error': e.toString()});
  }
}
