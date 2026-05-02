import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';
import 'package:drift/drift.dart';
import '../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  // Load environment variables
  var env = DotEnv(includePlatformEnvironment: true)..load();
  final secret = env['JWT_SECRET'] ?? 'default_secret';

  // Extract body
  final body = await context.request.json() as Map<String, dynamic>;
  final username = body['username'];
  final password = body['password'];

  // Access the database injected via middleware
  final db = context.read<AppDatabase>();

  // Optional: Seed initial admin user if none exists
  final count = await db.select(db.users).get();
  if (count.isEmpty) {
    await db.into(db.users).insert(
          UsersCompanion.insert(
            username: 'admin',
            passwordHash: 'password', // In production, this should be hashed
            role: const Value('admin'),
            fullName: const Value('Admin User'),
          ),
        );
  }

  // Find user in database
  final user = await (db.select(db.users)..where((u) => u.username.equals(username))).getSingleOrNull();

  // Validate credentials
  if (user != null && user.passwordHash == password) {
    // Generate JWT
    final jwt = JWT({
      'userId': user.id,
      'username': user.username,
      'role': user.role,
    });
    
    final token = jwt.sign(SecretKey(secret), expiresIn: const Duration(hours: 24));
    
    return Response.json(body: {
      'message': 'Login successful',
      'token': token,
      'user': {
        'id': user.id,
        'username': user.username,
        'role': user.role,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'fullName': user.fullName,
      }
    });
  }

  return Response.json(statusCode: 401, body: {'message': 'Invalid username or password'});
}
