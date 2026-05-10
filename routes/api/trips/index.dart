import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:drift/drift.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = context.read<AppDatabase>();
  final method = context.request.method;

  if (method == HttpMethod.get) {
    return _getTrips(context, db);
  } else if (method == HttpMethod.post) {
    return _createTrip(context, db);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _getTrips(RequestContext context, AppDatabase db) async {
  final queryParams = context.request.uri.queryParameters;
  final userIdStr = queryParams['userId'];
  final status = queryParams['status'];

  if (userIdStr == null) {
    return Response.json(
      body: {'message': 'userId is required'},
      statusCode: HttpStatus.badRequest,
    );
  }

  final userId = int.parse(userIdStr);

  // Use raw SQL to handle the new guideId column since generated code might be out of sync
  String sql = 'SELECT * FROM trips WHERE user_id = ?';
  List<Variable> variables = [Variable.withInt(userId)];
  
  if (status != null) {
    sql += ' AND status = ?';
    variables.add(Variable.withString(status));
  }

  final rows = await db.customSelect(sql, variables: variables).get();

  final trips = await Future.wait(rows.map((row) async {
    final tripId = row.read<int>('id');
    final guideId = row.readNullable<int>('guide_id');
    
    Map<String, dynamic>? guideData;
    if (guideId != null) {
      final guide = await (db.select(db.users)..where((u) => u.id.equals(guideId))).getSingleOrNull();
      if (guide != null) {
        guideData = {
          'id': guide.id,
          'fullName': guide.fullName ?? guide.username,
          'avatarUrl': guide.avatarUrl,
          'role': guide.role,
        };
      }
    }

    return {
      'id': tripId,
      'userId': row.read<int>('user_id'),
      'title': row.read<String>('title'),
      'destination': row.read<String>('destination'),
      'startDate': row.readNullable<String>('start_date'),
      'endDate': row.readNullable<String>('end_date'),
      'status': row.read<String>('status'),
      'imageUrl': row.readNullable<String>('image_url'),
      'guide': guideData,
    };
  }));

  return Response.json(body: trips);
}

Future<Response> _createTrip(RequestContext context, AppDatabase db) async {
  final body = await context.request.json() as Map<String, dynamic>;
  
  // Use customStatement for insertion as it handles nulls more easily in the variables list
  await db.customStatement(
    '''
    INSERT INTO trips (user_id, title, destination, status, start_date, end_date, image_url, guide_id)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''',
    [
      body['userId'] as int,
      body['title'] as String,
      body['destination'] as String,
      body['status'] as String? ?? 'next',
      body['startDate'] != null ? DateTime.parse(body['startDate'] as String).toIso8601String() : null,
      body['endDate'] != null ? DateTime.parse(body['endDate'] as String).toIso8601String() : null,
      body['imageUrl'] as String?,
      body['guideId'] as int?,
    ],
  );

  return Response.json(body: {'message': 'Trip created successfully'}, statusCode: HttpStatus.created);
}
