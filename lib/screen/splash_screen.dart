import 'dart:async';
import 'package:flutter/material.dart';
import 'package:insanberbagi/screen/home_screen.dart';
import 'package:insanberbagi/screen/login_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    return Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(color: Colors.green,

        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                          child : CircleAvatar(
                            backgroundColor: Color(0x5BC1AC),
                            radius: 150.0,
                            child: Image.asset('assets/images/insanberbagi.png'), // replace with your image path
                          ),
                      ),
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                   
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Berusaha Yang Terbaik",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      )          
              ],
            ),
      )
    );
  }
}
