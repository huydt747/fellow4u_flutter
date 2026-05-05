import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
  }

  final userId = context.read<int>();
  final db = context.read<AppDatabase>();

  // Fetch all conversations involving the user
  final conversations = await (db.select(db.conversations)
        ..where((c) => c.user1Id.equals(userId) | c.user2Id.equals(userId)))
      .get();

  List<Map<String, dynamic>> results = [];

  for (var conv in conversations) {
    // Identify the peer
    final peerId = (conv.user1Id == userId) ? conv.user2Id : conv.user1Id;
    
    // Fetch peer info
    final peerUser = await (db.select(db.users)..where((u) => u.id.equals(peerId))).getSingleOrNull();
    if (peerUser == null) continue;

    // Fetch the latest message for this conversation
    final lastMessage = await (db.select(db.messages)
          ..where((m) => m.conversationId.equals(conv.id))
          ..orderBy([(m) => OrderingTerm(expression: m.timestamp, mode: OrderingMode.desc)])
          ..limit(1))
        .getSingleOrNull();

    results.add({
      'conversationId': conv.id,
      'peerId': peerId,
      'peerName': peerUser.fullName ?? peerUser.username,
      'peerAvatarUrl': peerUser.avatarUrl ?? '/img/avatar/1.png',
      'lastMessage': lastMessage?.content ?? '',
      'timestamp': lastMessage?.timestamp.toIso8601String(),
      'unreadCount': 0, // Unread tracking is not implemented yet
    });
  }

  // Sort by timestamp descending
  results.sort((a, b) {
    if (a['timestamp'] == null) return 1;
    if (b['timestamp'] == null) return -1;
    return DateTime.parse(b['timestamp']).compareTo(DateTime.parse(a['timestamp']));
  });

  return Response.json(body: {'conversations': results});
}
