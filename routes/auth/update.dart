import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  final db = context.read<AppDatabase>();
  final body = await context.request.json() as Map<String, dynamic>;
  
  final userId = body['userId'] as int?;
  if (userId == null) {
    return Response.json(statusCode: 400, body: {'message': 'User ID required'});
  }

  // Update Users table with profile info
  await (db.update(db.users)..where((u) => u.id.equals(userId))).write(
    UsersCompanion(
      address: Value(body['address'] as String?),
      city: Value(body['city'] as String?),
      country: Value(body['country'] as String?),
      phone: Value(body['phone'] as String?),
      bio: Value(body['introduction'] as String?),
      // Image URLs would be handled here after upload
      guideLicenseUrl: Value(body['guideLicenseUrl'] as String?),
      identityCardUrl: Value(body['identityCardUrl'] as String?),
      videoIntroUrl: Value(body['videoIntroUrl'] as String?),
    ),
  );

  // Handle Fees if provided
  if (body['fees'] != null) {
    final fees = body['fees'] as List<dynamic>;
    for (final fee in fees) {
      await db.into(db.fees).insert(
        FeesCompanion.insert(
          userId: userId,
          minTravelers: fee['min'] as int,
          maxTravelers: fee['max'] as int,
          price: (fee['price'] as num).toDouble(),
        ),
      );
    }
  }

  // Handle Availability if provided
  if (body['availability'] != null) {
    final availability = body['availability'] as List<dynamic>;
    for (final slot in availability) {
      await db.into(db.availability).insert(
        AvailabilityCompanion.insert(
          userId: userId,
          dayOfWeek: slot['day'] as String,
          fromTime: slot['from'] as String,
          toTime: slot['to'] as String,
        ),
      );
    }
  }

  return Response.json(body: {'message': 'Profile updated successfully'});
}
