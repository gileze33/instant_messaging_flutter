import 'package:flutter/material.dart';
import 'package:instant_messaging_flutter/pages/conversations_list/conversations_list_page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // this will need to somehow match the 2 different app's bottom bars
    const tabBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.abc),
        label: "TODO",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: "Messages",
        
      ),
    ];

    return Scaffold(
      body: const ConversationsListPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabBarItems.length - 1,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: tabBarItems,
      ),
    );
  }
}