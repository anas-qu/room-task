import 'package:flutter/material.dart';

import 'features/room/presentation/pages/room_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Room Task',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: RoomPage(),
    );
  }
}

