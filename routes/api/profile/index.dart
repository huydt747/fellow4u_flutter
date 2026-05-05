import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  // Lấy userId từ middleware
  final userId = context.read<int>();
  final db = context.read<AppDatabase>();

  // Fetch User
  final userResult = await (db.select(db.users)..where((u) => u.id.equals(userId))).getSingleOrNull();
  
  if (userResult == null) {
    return Response.json(statusCode: 404, body: {'message': 'User not found'});
  }

  // Fetch Languages
  final userLangsQuery = db.select(db.userLanguages).join([
    innerJoin(db.languages, db.languages.id.equalsExp(db.userLanguages.languageId)),
  ])..where(db.userLanguages.userId.equals(userId));

  final userLangsResult = await userLangsQuery.get();
  final languages = userLangsResult.map((row) {
    return row.readTable(db.languages).name;
  }).toList();

  return Response.json(
    body: {
      'id': userResult.id,
      'fullName': userResult.fullName,
      'avatarUrl': userResult.avatarUrl,
      'coverPhotoUrl': userResult.coverPhotoUrl,
      'reviewCount': userResult.reviewCount,
      'bio': userResult.bio,
      'videoIntroUrl': userResult.videoIntroUrl,
      'languages': languages,
    },
  );
}
