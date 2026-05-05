import 'package:dart_frog/dart_frog.dart';
import 'package:drift/drift.dart';
import '../../../lib/database/database.dart';

Future<Response> onRequest(RequestContext context, String peerIdParam) async {
  final userId = context.read<int>();
  final db = context.read<AppDatabase>();
  final peerId = int.tryParse(peerIdParam);

  if (peerId == null) {
    return Response.json(statusCode: 400, body: {'message': 'Invalid peerId'});
  }

  // Check if peer exists
  final peerExists = await (db.select(db.users)..where((u) => u.id.equals(peerId))).getSingleOrNull();
  if (peerExists == null) {
    return Response.json(statusCode: 404, body: {'message': 'Peer user not found'});
  }

  // Find existing conversation
  final conv = await (db.select(db.conversations)
    ..where((c) => 
      (c.user1Id.equals(userId) & c.user2Id.equals(peerId)) |
      (c.user1Id.equals(peerId) & c.user2Id.equals(userId))
    ))
    .getSingleOrNull();

  if (context.request.method == HttpMethod.get) {
    if (conv == null) {
      return Response.json(body: {'messages': []});
    }

    final msgs = await (db.select(db.messages)
          ..where((m) => m.conversationId.equals(conv.id))
          ..orderBy([(m) => OrderingTerm(expression: m.timestamp, mode: OrderingMode.asc)]))
        .get();

    return Response.json(body: {
      'messages': msgs.map((m) => {
        'id': m.id,
        'senderId': m.senderId,
        'content': m.content,
        'timestamp': m.timestamp.toIso8601String(),
      }).toList(),
    });
  }

  if (context.request.method == HttpMethod.post) {
    final body = await context.request.json() as Map<String, dynamic>;
    final content = body['content'] as String?;

    if (content == null || content.isEmpty) {
      return Response.json(statusCode: 400, body: {'message': 'Content cannot be empty'});
    }

    int conversationId;
    if (conv == null) {
      // Create conversation
      conversationId = await db.into(db.conversations).insert(
        ConversationsCompanion.insert(
          user1Id: userId,
          user2Id: peerId,
        ),
      );
    } else {
      conversationId = conv.id;
    }

    final msgId = await db.into(db.messages).insert(
      MessagesCompanion.insert(
        conversationId: conversationId,
        senderId: userId,
        content: content,
        timestamp: Value(DateTime.now()),
      ),
    );

    final newMsg = await (db.select(db.messages)..where((m) => m.id.equals(msgId))).getSingle();

    return Response.json(body: {
      'id': newMsg.id,
      'senderId': newMsg.senderId,
      'content': newMsg.content,
      'timestamp': newMsg.timestamp.toIso8601String(),
    });
  }

  return Response.json(statusCode: 405, body: {'message': 'Method not allowed'});
}
