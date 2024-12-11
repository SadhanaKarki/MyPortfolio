import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sadhana Karki',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage() ,
        
    );
  }
}

