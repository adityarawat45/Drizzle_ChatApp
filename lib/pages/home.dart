import 'package:drizzle0/components/loader.dart';
import 'package:drizzle0/pages/chatpage.dart';
import 'package:drizzle0/components/usertile.dart';
import 'package:drizzle0/services/Auth/Auth.dart';
import 'package:drizzle0/components/drawer.dart';
import 'package:drizzle0/services/Chat/chatservice.dart';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void logout() {
  final auth = Auth();
  auth.signOut();
}

final ChatService _chatService = ChatService();
final Auth _auth = Auth();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        centerTitle: true,
        title: "Drizzle"
            .text
            .extraBold
            .size(28)
            .color(
              Theme.of(context).colorScheme.tertiary,
            )
            .make(),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
            color: Theme.of(context).colorScheme.tertiary,
          )
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStreamExcludingBlocked(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserlistItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserlistItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _auth.getCurrentUser()!.email) {
      return UserTile(
          username: userData["username"],
          email: userData["email"],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Chatpage(
                          recieverUsername: userData["username"],
                          recieverId: userData["uid"],
                        )));
          });
    } else {
      return Container();
    }
  }
}
