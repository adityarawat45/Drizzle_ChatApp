import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drizzle0/components/chatbubble.dart';
import 'package:drizzle0/components/loader.dart';
import 'package:drizzle0/services/Auth/auth.dart';
import 'package:drizzle0/services/Chat/chatservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Chatpage extends StatefulWidget {
  final String recieverUsername;
  final String recieverId;
  const Chatpage(
      {super.key, required this.recieverUsername, required this.recieverId});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final Auth _authService = Auth();
  final ChatService _chatService = ChatService();

  final TextEditingController _messageController = TextEditingController();
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.recieverId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.tertiary),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: widget.recieverUsername.text.bold
              .color(Theme.of(context).colorScheme.tertiary)
              .make()),
      body: Column(
        children: [
          const HeightBox(7),
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput()
        ],
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(widget.recieverId, senderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }

          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // HeightBox(7),
            Chatbubble(
              message: data["message"],
              isCurrentUser: isCurrentUser,
              messageId: doc.id,
              userId: data["senderId"],
            )
          ],
        )).pOnly(top: 1);
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
            child: TextField(
              style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary,fontSize: 14),
          controller: _messageController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inverseSurface),
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inverseSurface),
                  borderRadius: BorderRadius.circular(25)),
              fillColor: Theme.of(context).colorScheme.inverseSurface,
              filled: true,
              hintText: "Type a message...",
              hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary, fontSize: 13)),
        ).pOnly(left: 24).py8(),),
        Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: sendMessage,
                    icon: Icon(CupertinoIcons.paperplane_fill,
                        color: Theme.of(context).colorScheme.primary)))
            .px8()
      ],
    ).pOnly(bottom: 7);
  }
}
