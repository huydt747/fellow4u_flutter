import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:drift/drift.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final db = context.read<AppDatabase>();
  final method = context.request.method;

  if (method == HttpMethod.patch) {
    return _updateTrip(context, db, int.parse(id));
  } else if (method == HttpMethod.delete) {
    return _deleteTrip(context, db, int.parse(id));
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _updateTrip(RequestContext context, AppDatabase db, int id) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final status = body['status'] as String?;

  if (status == null) {
    return Response.json(
      body: {'message': 'status is required'},
      statusCode: HttpStatus.badRequest,
    );
  }

  await db.customStatement(
    'UPDATE trips SET status = ? WHERE id = ?',
    [status, id],
  );

  return Response.json(body: {'message': 'Trip updated successfully'});
}

Future<Response> _deleteTrip(RequestContext context, AppDatabase db, int id) async {
  await (db.delete(db.trips)..where((t) => t.id.equals(id))).go();
  return Response(statusCode: HttpStatus.noContent);
}
