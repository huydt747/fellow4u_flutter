import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import 'package:flutter_application_1/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final body = await context.request.json() as Map<String, dynamic>;
  final userId = body['userId'] as int?;

  if (userId == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: {'message': 'Missing userId'},
    );
  }

  final db = context.read<AppDatabase>();

  try {
    await db.transaction(() async {
      // 1. Update basic profile info
      final firstName = body['firstName'] as String?;
      final lastName = body['lastName'] as String?;
      final address = body['address'] as String?;
      final city = body['city'] as String?;
      final country = body['country'] as String?;
      final phone = body['phone'] as String?;
      final introduction = body['introduction'] as String?; // maps to bio
      final guideLicenseUrl = body['guideLicenseUrl'] as String?;
      final identityCardUrl = body['identityCardUrl'] as String?;
      final avatarUrl = body['avatarUrl'] as String?;
      final coverPhotoUrl = body['coverPhotoUrl'] as String?;
      final videoIntroUrl = body['videoIntroUrl'] as String?;

      if (firstName != null || lastName != null || address != null || city != null || 
          country != null || phone != null || introduction != null || 
          guideLicenseUrl != null || identityCardUrl != null ||
          avatarUrl != null || coverPhotoUrl != null || videoIntroUrl != null) {
        await (db.update(db.users)..where((u) => u.id.equals(userId))).write(
          UsersCompanion(
            firstName: firstName != null ? Value(firstName) : const Value.absent(),
            lastName: lastName != null ? Value(lastName) : const Value.absent(),
            address: address != null ? Value(address) : const Value.absent(),
            city: city != null ? Value(city) : const Value.absent(),
            country: country != null ? Value(country) : const Value.absent(),
            phone: phone != null ? Value(phone) : const Value.absent(),
            bio: introduction != null ? Value(introduction) : const Value.absent(),
            guideLicenseUrl: guideLicenseUrl != null ? Value(guideLicenseUrl) : const Value.absent(),
            identityCardUrl: identityCardUrl != null ? Value(identityCardUrl) : const Value.absent(),
            avatarUrl: avatarUrl != null ? Value(avatarUrl) : const Value.absent(),
            coverPhotoUrl: coverPhotoUrl != null ? Value(coverPhotoUrl) : const Value.absent(),
            videoIntroUrl: videoIntroUrl != null ? Value(videoIntroUrl) : const Value.absent(),
          ),
        );
      }

      // 2. Update Languages
      final languagesStr = body['languages'] as String?;
      if (languagesStr != null && languagesStr.isNotEmpty) {
        final languageNames = languagesStr.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty);
        
        // Remove existing associations first (optional, but cleaner for a replacement)
        await (db.delete(db.userLanguages)..where((ul) => ul.userId.equals(userId))).go();

        for (final name in languageNames) {
          // Get or create language
          var lang = await (db.select(db.languages)..where((l) => l.name.equals(name))).getSingleOrNull();
          if (lang == null) {
            final id = await db.into(db.languages).insert(LanguagesCompanion.insert(name: name));
            lang = await (db.select(db.languages)..where((l) => l.id.equals(id))).getSingle();
          }
          
          // Link user to language
          await db.into(db.userLanguages).insert(
            UserLanguagesCompanion.insert(userId: userId, languageId: lang.id),
            mode: InsertMode.insertOrIgnore,
          );
        }
      }

      // 3. Update Fees
      final fees = body['fees'] as List?;
      if (fees != null) {
        // Remove old fees
        await (db.delete(db.fees)..where((f) => f.userId.equals(userId))).go();
        
        for (final feeData in fees) {
          if (feeData is Map) {
            await db.into(db.fees).insert(
              FeesCompanion.insert(
                userId: userId,
                minTravelers: (feeData['min'] as num).toInt(),
                maxTravelers: (feeData['max'] as num).toInt(),
                price: (feeData['price'] as num).toDouble(),
              ),
            );
          }
        }
      }

      // 4. Update Availability
      final availability = body['availability'] as List?;
      if (availability != null) {
        // Remove old availability
        await (db.delete(db.availability)..where((a) => a.userId.equals(userId))).go();
        
        for (final availData in availability) {
          if (availData is Map) {
            await db.into(db.availability).insert(
              AvailabilityCompanion.insert(
                userId: userId,
                dayOfWeek: availData['day'] as String,
                fromTime: availData['from'] as String,
                toTime: availData['to'] as String,
              ),
            );
          }
        }
      }
    });

    return Response.json(
      body: {'message': 'Profile updated successfully'},
    );
  } catch (e) {
    return Response.json(
      statusCode: HttpStatus.internalServerError,
      body: {'message': 'Update failed: $e'},
    );
  }
}
