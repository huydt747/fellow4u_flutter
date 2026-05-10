import 'api_service.dart';

class ChatService {
  static Future<List<dynamic>> getConversations(int userId) async {
    final response = await ApiService.get("api/chat/conversations?userId=$userId");
    return response as List<dynamic>;
  }

  static Future<List<dynamic>> getMessages(int conversationId) async {
    final response = await ApiService.get("api/chat/messages?conversationId=$conversationId");
    return response as List<dynamic>;
  }

  static Future<Map<String, dynamic>> sendMessage(int conversationId, int senderId, String content) async {
    final response = await ApiService.post("api/chat/messages", {
      "conversationId": conversationId,
      "senderId": senderId,
      "content": content,
    });
    return response as Map<String, dynamic>;
  }

  static Future<int> createConversation(int user1Id, int user2Id) async {
    final response = await ApiService.post("api/chat/conversations", {
      "user1Id": user1Id,
      "user2Id": user2Id,
    });
    return response['id'] as int;
  }
}
