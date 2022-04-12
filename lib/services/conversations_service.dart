import 'package:instant_messaging_flutter/services/service_locator.dart';
import 'package:instant_messaging_flutter/services/api_service.dart';
class ConversationParticipant {
  late String? initials;
  late String? imageUrl;
  late String? name;

  ConversationParticipant({required this.initials, required this.imageUrl, required this.name});

  ConversationParticipant.fromJson(Map<String, dynamic> json) {
    initials = json['initials'] as String;
    imageUrl = json['imageUrl'] as String;
    name = json['name'] as String;
  }
}

class Conversation {
  late String conversationId;
  late String? title;
  late bool allMessagesRead;
  late DateTime? lastMessageDate;
  late String? lastMessage;
  late List<ConversationParticipant> participants;

  Conversation({required this.conversationId, required this.title, required this.allMessagesRead, required this.lastMessageDate, required this.lastMessage, required this.participants});

  Conversation.fromJson(Map<String, dynamic> json) {
    conversationId = json['id'] as String;
    title = json['title'] as String;
    allMessagesRead = json['allMessagesRead'] as bool;
    lastMessageDate = json['readCursor']?['lastReadMessageCreatedAt'] as DateTime?;
    lastMessage = json['lastMessage']?['message'] as String?;

    participants = (json['participants'] as List<dynamic>).map((participant) {
      return ConversationParticipant.fromJson(participant);
    }).toList();
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
    print('before');
    final response = await _apiService.getConversations(start, limit);

    print('response');

    final conversationJsons = response['conversations'] as List<dynamic>;

    List<Conversation> conversations = conversationJsons.map((conversationJson) => Conversation.fromJson(conversationJson)).toList();

    return conversations;
  }
  
}