import 'package:calling_app/core/theme.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'message_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audora',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home:  ChatScreen(),
    );
  }
}

