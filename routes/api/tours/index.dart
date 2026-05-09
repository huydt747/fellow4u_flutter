import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:drift/drift.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final db = context.read<AppDatabase>();

  // Use customSelect to bypass out-of-sync generated code
  try {
    final rows = await db.customSelect('SELECT * FROM tours').get();

    final tourList = rows.map((row) => {
      'id': row.read<int>('id'),
      'title': row.read<String>('title'),
      'location': row.readNullable<String>('location'),
      'price': row.read<double>('price'),
      'rating': row.read<double>('rating'),
      'imageUrl': row.readNullable<String>('image_url'),
      'date': row.readNullable<String>('date'),
      'duration': row.readNullable<String>('duration'),
      'likes': row.read<int>('likes'),
    }).toList();

    return Response.json(body: tourList);
  } catch (e) {
    return Response.json(statusCode: 500, body: {'error': e.toString()});
  }
}
