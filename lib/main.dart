import 'package:drizzle0/services/Auth/auth_gate.dart';
import 'package:drizzle0/firebase_options.dart';
import 'package:drizzle0/themes/theme.dart';
import 'package:drizzle0/themes/themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider() ,
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Drizzle',debugShowCheckedModeBanner: false, theme: darkMode, home: const AuthGate());
  }
}
