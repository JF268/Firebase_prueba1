import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tareas/pages/home_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tareas/pages/login_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tareas-Firebase",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: LoginPage(),
    );
    }
}