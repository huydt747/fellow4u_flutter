import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:drift/drift.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = context.read<AppDatabase>();
  final method = context.request.method;

  if (method == HttpMethod.get) {
    return _getConversations(context, db);
  } else if (method == HttpMethod.post) {
    return _createConversation(context, db);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _getConversations(RequestContext context, AppDatabase db) async {
  final queryParams = context.request.uri.queryParameters;
  final userIdStr = queryParams['userId'];

  if (userIdStr == null) {
    return Response.json(
      body: {'message': 'userId is required'},
      statusCode: HttpStatus.badRequest,
    );
  }

  final userId = int.parse(userIdStr);

  // Get conversations where the user is either user1 or user2
  final query = db.select(db.conversations)
    ..where((c) => c.user1Id.equals(userId) | c.user2Id.equals(userId));

  final results = await query.get();

  final conversations = <Map<String, dynamic>>[];

  for (final conversation in results) {
    
    // Determine the "other" user
    final otherUserId = (conversation.user1Id == userId) ? conversation.user2Id : conversation.user1Id;
    
    // Fetch other user's info
    final otherUser = await (db.select(db.users)..where((u) => u.id.equals(otherUserId))).getSingle();

    // Get last message for this conversation
    final lastMessage = await (db.select(db.messages)
      ..where((m) => m.conversationId.equals(conversation.id))
      ..orderBy([(m) => OrderingTerm(expression: m.timestamp, mode: OrderingMode.desc)])
      ..limit(1))
      .getSingleOrNull();

    conversations.add({
      'id': conversation.id,
      'otherUser': {
        'id': otherUser.id,
        'fullName': otherUser.fullName ?? otherUser.username,
        'avatarUrl': otherUser.avatarUrl,
      },
      'lastMessage': lastMessage?.content,
      'lastMessageTime': lastMessage?.timestamp.toIso8601String(),
    });
  }

  return Response.json(body: conversations);
}

Future<Response> _createConversation(RequestContext context, AppDatabase db) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final user1Id = body['user1Id'] as int?;
  final user2Id = body['user2Id'] as int?;

  if (user1Id == null || user2Id == null) {
    return Response.json(
      body: {'message': 'user1Id and user2Id are required'},
      statusCode: HttpStatus.badRequest,
    );
  }

  // Check if conversation already exists
  final existing = await (db.select(db.conversations)
    ..where((c) => 
      (c.user1Id.equals(user1Id) & c.user2Id.equals(user2Id)) |
      (c.user1Id.equals(user2Id) & c.user2Id.equals(user1Id))
    ))
    .getSingleOrNull();

  if (existing != null) {
    return Response.json(body: {'id': existing.id});
  }

  // Create new conversation
  final id = await db.into(db.conversations).insert(
    ConversationsCompanion.insert(
      user1Id: user1Id,
      user2Id: user2Id,
    ),
  );

  return Response.json(body: {'id': id}, statusCode: HttpStatus.created);
}
