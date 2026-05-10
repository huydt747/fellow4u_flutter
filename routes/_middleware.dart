import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_application_1/database/database.dart';

AppDatabase? _db;

Handler middleware(Handler handler) {
  return (context) async {
    try {
      // Handle CORS preflight requests
      if (context.request.method == HttpMethod.options) {
        return Response(
          statusCode: HttpStatus.noContent,
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept, Authorization',
          },
        );
      }

      _db ??= AppDatabase(NativeDatabase(File(p.join(Directory.current.path, 'db.sqlite'))));
      
      final response = await handler.use(
        provider<AppDatabase>((_) => _db!),
      )(context);
      
      // Add CORS headers to all responses
      return response.copyWith(
        headers: {
          ...response.headers,
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': '*',
          'Access-Control-Allow-Credentials': 'true',
        },
      );
    } catch (e) {
      return Response.json(
        statusCode: HttpStatus.internalServerError,
        body: {'error': e.toString()},
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': '*',
        },
      );
    }
  };
}
