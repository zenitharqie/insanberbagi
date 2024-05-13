// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insanberbagi/screen/forgotpass_screen.dart';
import 'package:insanberbagi/screen/home_screen.dart';
import 'package:insanberbagi/screen/register_screen.dart';
import 'package:insanberbagi/widget/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var db = FirebaseFirestore.instance;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.green.withOpacity(0.12),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor: Colors.green.withOpacity(0.12),
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        )
                            .then((value) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Navbar()),
                            (route) => false,
                          );
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Data Tidak Ditemukan"),
                            ),
                          );
                        });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    )
                  ],
                ),
              ),
              _forgotPassword(context),
              _signUP(context),
            ],
          ),
        ),
      ),
    );
  }
}

_header(context) {
  return Column(
    children: [
      Text("Login Page",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      Text("insanberbagi")
    ],
  );
}

_forgotPassword(context) {
  return TextButton(
      onPressed: () {},
      child: Text("Forgot Password?", style: TextStyle(color: Colors.green)));
}

_signUP(context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't Have an Account ?"),
          SizedBox(width: 2), // Adjust the width here
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Navbar()),
          );
        },
        child: Text(
          "Continue as Guest",
          style: TextStyle(color: Colors.green),
        ),
      ),
    ],
  );
}




