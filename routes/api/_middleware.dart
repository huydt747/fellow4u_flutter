import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';

String _getJwtSecret() {
  try {
    final env = DotEnv(includePlatformEnvironment: true)..load();
    return env['JWT_SECRET'] ?? 'default_secret';
  } catch (_) {
    return 'default_secret';
  }
}

Handler middleware(Handler handler) {
  return (context) async {
    // Check Authorization header
    final authorization = context.request.headers['authorization'];
    if (authorization == null || !authorization.startsWith('Bearer ')) {
      return Response.json(
        statusCode: 401,
        body: {'message': 'Missing or invalid Authorization header'},
      );
    }

    final token = authorization.substring('Bearer '.length);

    try {
      final secret = _getJwtSecret();
      final jwt = JWT.verify(token, SecretKey(secret));
      
      // Extract userId from payload
      final payload = jwt.payload as Map<String, dynamic>;
      final userId = payload['userId'] as int?;
      
      if (userId == null) {
        return Response.json(
          statusCode: 401,
          body: {'message': 'Invalid token payload'},
        );
      }

      // Provide userId to child handlers
      return handler.use(provider<int>((_) => userId)).call(context);
      
    } catch (e) {
      print('[API Middleware] Token verification failed: $e');
      return Response.json(
        statusCode: 401,
        body: {'message': 'Unauthorized: Invalid or expired token'},
      );
    }
  };
}
