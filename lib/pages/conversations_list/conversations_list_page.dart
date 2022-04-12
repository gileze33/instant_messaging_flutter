import 'package:flutter/material.dart';
import 'package:instant_messaging_flutter/services/conversations_service.dart';

class ConversationsListPage extends StatefulWidget {
  const ConversationsListPage({Key? key}) : super(key: key);

  @override
  State<ConversationsListPage> createState() => _ConversationsListPageState();
}

class _ConversationsListPageState extends State<ConversationsListPage> {
  List<Conversation> conversations = [
    // dummy data for now
    Conversation(conversationId: "conversationId", title: "Giles Williams", allMessagesRead: true, lastMessageDate: DateTime(2020, 1, 1), lastMessage: "hello this is giles", participants: [ConversationParticipant(initials: "GW", imageUrl: null, name: "Giles Williams")]),
  ];

  @override
  Widget build(BuildContext context) {
    final conversationCount = conversations.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have this many conversations:',
            ),
            Text(
              '$conversationCount',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}