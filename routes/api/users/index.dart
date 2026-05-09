import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:drift/drift.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final db = context.read<AppDatabase>();
  final queryParams = context.request.uri.queryParameters;
  final roleFilter = queryParams['role'];

  String sql = 'SELECT * FROM users';
  List<Variable> variables = [];
  
  if (roleFilter != null) {
    sql += ' WHERE role = ?';
    variables.add(Variable.withString(roleFilter));
  }
  
  final rows = await db.customSelect(sql, variables: variables).get();

  final userList = await Future.wait(rows.map((row) async {
    final userId = row.read<int>('id');
    
    // Fetch languages using existing generated code as it's likely fine
    final languages = await (db.select(db.userLanguages)..where((ul) => ul.userId.equals(userId))).get();
    final langDetails = <String>[];
    
    for (final l in languages) {
      final lang = await (db.select(db.languages)..where((table) => table.id.equals(l.languageId))).getSingle();
      langDetails.add(lang.name);
    }

    return {
      'id': userId,
      'username': row.read<String>('username'),
      'firstName': row.readNullable<String>('first_name'),
      'lastName': row.readNullable<String>('last_name'),
      'fullName': row.readNullable<String>('full_name'),
      'role': row.read<String>('role'),
      'address': row.readNullable<String>('address'),
      'city': row.readNullable<String>('city'),
      'country': row.readNullable<String>('country'),
      'phone': row.readNullable<String>('phone'),
      'bio': row.readNullable<String>('bio'),
      'avatarUrl': row.readNullable<String>('avatar_url'),
      'rating': row.read<double>('rating'),
      'reviewCount': row.read<int>('review_count'),
      'activityTitle': row.readNullable<String>('activity_title'),
      'activityImageUrl': row.readNullable<String>('activity_image_url'),
      'languages': langDetails,
    };
  }));

  return Response.json(body: userList);
}
