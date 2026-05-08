import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final body = await context.request.json() as Map<String, dynamic>;
  final username = body['username'] as String?;
  final password = body['password'] as String?;
  final firstName = body['firstName'] as String?;
  final lastName = body['lastName'] as String?;
  final role = body['role'] as String? ?? 'Traveler';

  if (username == null || password == null || firstName == null || lastName == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: {'message': 'Missing required fields'},
    );
  }

  final db = context.read<AppDatabase>();
  
  // Hash password
  final passwordHash = sha256.convert(utf8.encode(password)).toString();

  try {
    final userId = await db.into(db.users).insert(
      UsersCompanion.insert(
        username: username,
        passwordHash: passwordHash,
        firstName: Value(firstName),
        lastName: Value(lastName),
        fullName: Value('$firstName $lastName'),
        role: Value(role),
      ),
    );

    return Response.json(
      body: {
        'message': 'User registered successfully',
        'userId': userId,
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.conflict,
      body: {'message': 'Username already exists or database error: $e'},
    );
  }
}
