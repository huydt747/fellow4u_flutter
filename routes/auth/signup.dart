import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  final db = context.read<AppDatabase>();
  final body = await context.request.json() as Map<String, dynamic>;
  
  final username = body['username'] as String?; // email in the UI
  final password = body['password'] as String?;
  final firstName = body['firstName'] as String?;
  final lastName = body['lastName'] as String?;
  final role = body['role'] as String? ?? 'Traveler';

  print('Signup Request: username=$username, role=$role');

  if (username == null || password == null || username.length < 3) {
    return Response.json(
      statusCode: 400,
      body: {'message': 'Invalid email or password'},
    );
  }

  // Check if user already exists
  final existingUser = await (db.select(db.users)
        ..where((u) => u.username.equals(username)))
      .getSingleOrNull();

  if (existingUser != null) {
    return Response.json(
      statusCode: 400,
      body: {'message': 'Email already exists'},
    );
  }

  // Create new user
  try {
    final fullName = (firstName != null && lastName != null) 
        ? '$firstName $lastName' 
        : (firstName ?? lastName ?? '');

    final id = await db.into(db.users).insert(
          UsersCompanion.insert(
            username: username,
            passwordHash: password,
            firstName: Value(firstName),
            lastName: Value(lastName),
            fullName: Value(fullName),
            role: Value(role),
          ),
        );

    return Response.json(
      statusCode: 201,
      body: {
        'message': 'User created successfully',
        'userId': id,
      },
    );
  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {'message': 'Error creating user: $e'},
    );
  }
}
