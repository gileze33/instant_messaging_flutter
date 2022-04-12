import 'package:flutter/material.dart';
import 'package:instant_messaging_flutter/pages/conversations_list/conversations_list_page.dart';
import 'package:instant_messaging_flutter/pages/home/home_page.dart';
import 'package:instant_messaging_flutter/services/service_locator.dart';

void main() {
  b2cEntrypoint();
}

// use this entrypoint in the b2c app
void b2cEntrypoint() {
  setupGetItB2C();
  runApp(const MyApp(userType: UserType.b2c));
}

// use this entrypoint in the hero app
void heroEntrypoint() {
  setupGetItHero();
  runApp(const MyApp(userType: UserType.hero));
}

enum UserType {
  hero,
  b2c,
}

// boilerplate below here
class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userType}) : super(key: key);

  final UserType userType;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}