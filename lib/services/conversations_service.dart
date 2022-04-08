import 'package:instant_messaging_flutter/services/service_locator.dart';
import 'package:instant_messaging_flutter/services/api_service.dart';

class Conversation {
  late String conversationId;
  late String title;
  late bool allMessagesRead;
  late DateTime? lastMessageDate;

  Conversation({required this.conversationId, required this.title, required this.allMessagesRead, required this.lastMessageDate});

  Conversation.fromJson(Map<String, dynamic> json) {
    conversationId = json['id'] as String;
    title = json['title'] as String;
    allMessagesRead = json['allMessagesRead'] as bool;
    lastMessageDate = json['readCursor']?['lastReadMessageCreatedAt'] as DateTime?;
  }
}

abstract class ConversationsService {
  Future<List<Conversation>> getConversations(int start, int limit);
}

class ConversationsServiceImpl extends ConversationsService {
  final _apiService = getIt<ApiService>();
  
  @override
  Future<List<Conversation>> getConversations(int start, int limit) async {
    // unsure best SOC/responsibilities of parsing etc for ApiService vs data repository (this class)
    final response = await _apiService.getConversations(start, limit);

    final conversationJsons = response['conversations'] as List<dynamic>;

    List<Conversation> conversations = conversationJsons.map((conversationJson) => Conversation.fromJson(conversationJson)).toList();

    return conversations;
  }
  
}