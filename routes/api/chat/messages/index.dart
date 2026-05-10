import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:drift/drift.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = context.read<AppDatabase>();
  final method = context.request.method;

  if (method == HttpMethod.get) {
    return _getMessages(context, db);
  } else if (method == HttpMethod.post) {
    return _createMessage(context, db);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _getMessages(RequestContext context, AppDatabase db) async {
  final queryParams = context.request.uri.queryParameters;
  final conversationIdStr = queryParams['conversationId'];

  if (conversationIdStr == null) {
    return Response.json(
      body: {'message': 'conversationId is required'},
      statusCode: HttpStatus.badRequest,
    );
  }

  final conversationId = int.parse(conversationIdStr);

  final messages = await (db.select(db.messages)
    ..where((m) => m.conversationId.equals(conversationId))
    ..orderBy([(m) => OrderingTerm(expression: m.timestamp, mode: OrderingMode.asc)]))
    .get();

  return Response.json(
    body: messages.map((m) => {
      'id': m.id,
      'conversationId': m.conversationId,
      'senderId': m.senderId,
      'content': m.content,
      'timestamp': m.timestamp.toIso8601String(),
    }).toList(),
  );
}

Future<Response> _createMessage(RequestContext context, AppDatabase db) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final conversationId = body['conversationId'] as int?;
  final senderId = body['senderId'] as int?;
  final content = body['content'] as String?;

  if (conversationId == null || senderId == null || content == null) {
    return Response.json(
      body: {'message': 'conversationId, senderId, and content are required'},
      statusCode: HttpStatus.badRequest,
    );
  }

  final id = await db.into(db.messages).insert(
    MessagesCompanion.insert(
      conversationId: conversationId,
      senderId: senderId,
      content: content,
      timestamp: Value(DateTime.now()),
    ),
  );

  final newMessage = await (db.select(db.messages)..where((m) => m.id.equals(id))).getSingle();

  return Response.json(
    body: {
      'id': newMessage.id,
      'conversationId': newMessage.conversationId,
      'senderId': newMessage.senderId,
      'content': newMessage.content,
      'timestamp': newMessage.timestamp.toIso8601String(),
    },
    statusCode: HttpStatus.created,
  );
}
