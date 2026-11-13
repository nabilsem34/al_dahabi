import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AlDahabiApp());
}

class AlDahabiApp extends StatelessWidget {
  const AlDahabiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Dahabi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[900],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
      ),
      home: HomeScreen(),
    );
  }
}