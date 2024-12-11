import 'package:flutter/material.dart';
void main() => runApp(const AnimatedAlignExample());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: Scaffold(
        appBar: AppBar(
          
        ),
        body: AnimatedAlignExample(),
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        child: AnimatedAlign(

          alignment:
          selected ? Alignment.center : Alignment.bottomLeft,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 50),
        ),
        ),
      ),
    );
  }
}