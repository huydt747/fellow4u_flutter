import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  // Lấy userId trực tiếp từ token middleware thay vì query parameter
  final userId = context.read<int>();
  final db = context.read<AppDatabase>();

  // Fetch Trips
  final tripsList = await (db.select(db.trips)..where((t) => t.userId.equals(userId))).get();
  
  final trips = tripsList.map((t) => {
    'id': t.id,
    'title': t.title,
    'destination': t.destination,
    'startDate': t.startDate?.toIso8601String(),
    'endDate': t.endDate?.toIso8601String(),
    'status': t.status,
    'imageUrl': t.imageUrl,
    'date': 'Jan 30, 2020',
    'duration': '3 days',
    'price': t.title.contains('Sydney') ? '\$600.00' : '\$300.00',
    'rating': t.title.contains('Sydney') ? 4.5 : 5.0,
    'likes': '1247 likes',
    'isLiked': t.title.contains('Sydney') ? true : false,
  }).toList();

  return Response.json(body: {'trips': trips});
}
