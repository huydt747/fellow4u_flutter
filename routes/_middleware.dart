import 'dart:io';
import 'dart:ffi';
import 'package:dart_frog/dart_frog.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import '../lib/database/database.dart';

// Load sqlite3.dll trước khi khởi tạo DB
final _lib = DynamicLibrary.open(p.join(Directory.current.path, 'sqlite3.dll'));

AppDatabase? _dbInstance;

AppDatabase get _db {
  _dbInstance ??= AppDatabase(
    NativeDatabase.createInBackground(
      File(p.join(Directory.current.path, 'db.sqlite')),
    ),
  );
  return _dbInstance!;
}

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<AppDatabase>((_) => _db))
      .use(_corsMiddleware());
}

Middleware _corsMiddleware() {
  return (handler) {
    return (context) async {
      if (context.request.method == HttpMethod.options) {
        return Response(
          statusCode: 204,
          headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers':
                'Origin, Content-Type, Authorization',
          },
        );
      }
      final response = await handler(context);
      return response.copyWith(
        headers: {
          ...response.headers,
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type, Authorization',
        },
      );
    };
  };
}
