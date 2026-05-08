import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final body = await context.request.json() as Map<String, dynamic>;
  final username = body['username'] as String?;
  final password = body['password'] as String?;

  if (username == null || password == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: {'message': 'Missing username or password'},
    );
  }

  final db = context.read<AppDatabase>();

  final passwordHash = sha256.convert(utf8.encode(password)).toString();

  final user =
      await (db.select(db.users)
            ..where((u) => u.username.equals(username))
            ..where((u) => u.passwordHash.equals(passwordHash)))
          .getSingleOrNull();

  if (user == null) {
    return Response.json(
      statusCode: HttpStatus.unauthorized,
      body: {'message': 'Invalid username or password'},
    );
  }

  return Response.json(
    body: {
      'message': 'Login successful',
      'user': {
        'id': user.id,
        'username': user.username,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'role': user.role,
      },
    },
  );
}
