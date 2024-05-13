import 'package:flutter/material.dart';

void main() {
  runApp(Explore());
}

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              _header(context),
            ],
          ),
        ),
      ),
    );
  }
}

_header(context){
    return AppBar(
      title: Text("Explore Your Social Chairty"),
      backgroundColor: Colors.green
      );
   }