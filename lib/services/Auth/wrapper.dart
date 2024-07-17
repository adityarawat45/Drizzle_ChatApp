import 'package:drizzle0/pages/login.dart';
import 'package:drizzle0/pages/signup.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  bool showLogin = true;
  @override
  Widget build(BuildContext context) {
    return showLogin
        ? Login(toggle: toggleView)
        : Signup(toggle: toggleView);
  }
}
