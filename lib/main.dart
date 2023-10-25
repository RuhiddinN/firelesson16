import 'package:firebase_core/firebase_core.dart';
import 'package:firelesson16/home_page.dart';
import 'package:firelesson16/rtdb_services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        RtdbPages.id: (context) => const RtdbPages(),
      },
    );
  }
}
