import 'package:apiforquran/screens/home_screen.dart';
import 'package:apiforquran/screens/prayer_screen.dart';
import 'package:apiforquran/screens/quran_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Soul',
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Poppins'),
      home: const QuranScreen(),
    );
  }
}
