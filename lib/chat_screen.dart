import 'package:flutter/material.dart';

import 'core/theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(radius: 30),
            SizedBox(width: 10),
            Text(
              'Natasha Areej',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                _buildReceivedMessage(context, "Test test"),
                _buildSentMessage(context, "Test test"),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: DefaultColors.receiverMessage,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildSentMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: DefaultColors.senderMessage,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(Icons.camera_alt, color: Colors.grey),
            onTap: () {},
          ),

          SizedBox(width: 10),

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Message...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),

          SizedBox(width: 10),

          GestureDetector(
            child: Icon(Icons.send, color: Colors.grey),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
