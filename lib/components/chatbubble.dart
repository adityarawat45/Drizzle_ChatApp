import 'package:drizzle0/services/Chat/chatservice.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;
  Chatbubble(
      {super.key,
      required this.message,
      required this.isCurrentUser,
      required this.messageId,
      required this.userId});

  //show otpions
  void _showoptions(BuildContext context, String messageId, String userId) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: [
              //report user
              ListTile(
                leading: const Icon(Icons.flag),
                title: "Report".text.make(),
                onTap: () {
                  Navigator.pop(context);
                  _reportContent(context, messageId, userId);
                },
              ),
              ListTile(
                leading: const Icon(Icons.block_rounded),
                title: "Block".text.make(),
                onTap: () {
                  Navigator.pop(context);
                  _blockuser(context, userId);
                },
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: "Cancel".text.make(),
                onTap: () {},
              )

              //block user

              //cancel
            ],
          ));
        });
  }

  final ChatService _chatService = ChatService();

  void _reportContent(BuildContext context, String messageId, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 6, 18, 24),
          titleTextStyle: TextStyle(color: Colors.grey),
          contentTextStyle: TextStyle(color: Colors.grey),
              title: "Report message".text.make(),
              content: "Are you sure?".text.make(),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: "Cancel".text.white.make()),
                TextButton(
                    onPressed: () {
                      _chatService.reportUser(messageId, userId);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Vx.gray100,
                          content: Text(
                            "Message Reported",
                            style: TextStyle(color: Colors.black),
                          )));
                    },
                    child: "Report".text.white.make()),
              ],
            ));
  }

  void _blockuser(BuildContext context, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: "Block User".text.make(),
              content: "Are you sure?".text.make(),
               titleTextStyle: TextStyle(color: Colors.grey),
               backgroundColor: const Color.fromARGB(255, 6, 18, 24),
          contentTextStyle: TextStyle(color: Colors.grey),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: "Cancel".text.white.make()),
                TextButton(
                    onPressed: () {
                      _chatService.blockUser(userId);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color.fromARGB(255, 5, 25, 36),
                          content: Text(
                            "User blocked",
                            style: TextStyle(
                                color: Color.fromARGB(255, 195, 216, 227)),
                          )));
                    },
                    child: "Block".text.white.make()),
              ],
            ));
  }

  //block user
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (!isCurrentUser) {
          //show
          _showoptions(context, messageId, userId);
        }
      },
      child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topRight: isCurrentUser
                          ? Radius.circular(0)
                          : Radius.circular(12),
                      topLeft: isCurrentUser
                          ? Radius.circular(12)
                          : Radius.circular(0))),
              child: message.text
                  .color(Theme.of(context).colorScheme.inversePrimary)
                  .medium
                  .size(14)
                  .make()
                  .px12()
                  .py12())
          .pOnly(top: 3)
          .px8()
          .pOnly(left: isCurrentUser ? 90 : 7, right: isCurrentUser ? 7 : 90),
    );
  }
}
