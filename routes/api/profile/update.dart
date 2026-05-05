import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  final userId = context.read<int>(); // From JWT middleware
  final db = context.read<AppDatabase>();
  final body = await context.request.json() as Map<String, dynamic>;

  // Build update companion with only provided fields
  await (db.update(db.users)..where((u) => u.id.equals(userId))).write(
    UsersCompanion(
      firstName: body.containsKey('firstName') ? Value(body['firstName'] as String?) : const Value.absent(),
      lastName: body.containsKey('lastName') ? Value(body['lastName'] as String?) : const Value.absent(),
      fullName: body.containsKey('fullName') ? Value(body['fullName'] as String?) : const Value.absent(),
      address: body.containsKey('address') ? Value(body['address'] as String?) : const Value.absent(),
      city: body.containsKey('city') ? Value(body['city'] as String?) : const Value.absent(),
      country: body.containsKey('country') ? Value(body['country'] as String?) : const Value.absent(),
      phone: body.containsKey('phone') ? Value(body['phone'] as String?) : const Value.absent(),
      bio: body.containsKey('bio') ? Value(body['bio'] as String?) : const Value.absent(),
    ),
  );

  // Fetch updated user to return
  final updatedUser = await (db.select(db.users)..where((u) => u.id.equals(userId))).getSingle();

  return Response.json(body: {
    'message': 'Profile updated successfully',
    'user': {
      'id': updatedUser.id,
      'username': updatedUser.username,
      'role': updatedUser.role,
      'firstName': updatedUser.firstName,
      'lastName': updatedUser.lastName,
      'fullName': updatedUser.fullName,
      'avatarUrl': updatedUser.avatarUrl,
      'bio': updatedUser.bio,
    },
  });
}
