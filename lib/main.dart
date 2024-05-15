import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insanberbagi/firebase_options.dart';
import 'package:insanberbagi/screen/login_screen.dart';
import 'package:insanberbagi/screen/register_screen.dart';
import 'package:insanberbagi/screen/splash_screen.dart';
import 'package:insanberbagi/widget/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); 
  runApp(HomeScreen()); 
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Set initial route
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}
