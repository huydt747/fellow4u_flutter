import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:drift/drift.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final db = context.read<AppDatabase>();

  try {
    // Raw SQL bypass for out-of-sync models
    final rows = await db.customSelect('SELECT * FROM news').get();

    final newsList = rows.map((row) => {
      'id': row.read<int>('id'),
      'title': row.read<String>('title'),
      'date': row.read<String>('date'),
      'imageUrl': row.read<String>('image_url'),
    }).toList();

    return Response.json(body: newsList);
  } catch (e) {
    // If table doesn't exist yet, return empty list or error
    return Response.json(body: []);
  }
}
