import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.red]).createShader(bounds);
          },
          blendMode: BlendMode.color,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "images/Flutter.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
