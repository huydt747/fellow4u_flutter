import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  final db = context.read<AppDatabase>();

  // Fetch Guides
  final guidesList = await db.select(db.guides).get();
  final guides = guidesList.map((g) => {
    'id': g.id,
    'name': g.name,
    'location': g.location,
    'reviewCount': g.reviewCount,
    'avatarUrl': g.avatarUrl,
  }).toList();

  // Fetch Tours (Featured Tours)
  final toursList = await db.select(db.tours).get();
  final tours = toursList.map((t) => {
    'id': t.id,
    'title': t.title,
    'location': t.location, // Using this for date & duration
    'price': t.price,
    'likes': t.rating, // Using rating to store likes
    'imageUrl': t.imageUrl,
  }).toList();

  // Fetch Experiences
  final experiencesList = await db.select(db.experiences).get();
  final experiences = experiencesList.map((e) => {
    'id': e.id,
    'title': e.title,
    'location': e.location,
    'price': e.price,
    'rating': e.rating,
    'imageUrl': e.imageUrl,
    // Add missing hardcoded data for Experiences since schema is incomplete
    'guideName': e.title.contains('Bicycle') ? 'Tuan Tran' : 'Linh Hana',
    'guideImageUrl': e.title.contains('Bicycle') ? 'img/avatar/5.png' : 'img/avatar/6.png',
  }).toList();

  return Response.json(
    body: {
      'guides': guides,
      'tours': tours,
      'experiences': experiences,
    },
  );
}
