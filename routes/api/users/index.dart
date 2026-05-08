import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final db = context.read<AppDatabase>();
  final allUsers = await db.select(db.users).get();

  final userList = await Future.wait(allUsers.map((user) async {
    final languages = await (db.select(db.userLanguages)..where((ul) => ul.userId.equals(user.id))).get();
    final langDetails = <String>[];
    
    for (final l in languages) {
      final lang = await (db.select(db.languages)..where((table) => table.id.equals(l.languageId))).getSingle();
      langDetails.add(lang.name);
    }

    return {
      'id': user.id,
      'username': user.username,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'fullName': user.fullName,
      'role': user.role,
      'address': user.address,
      'city': user.city,
      'country': user.country,
      'phone': user.phone,
      'bio': user.bio,
      'avatarUrl': user.avatarUrl,
      'rating': user.rating,
      'reviewCount': user.reviewCount,
      'languages': langDetails,
    };
  }));

  return Response.json(body: userList);
}
