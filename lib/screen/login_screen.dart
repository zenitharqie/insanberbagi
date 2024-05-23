import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _header(context),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _emailField(),
                      SizedBox(height: 20),
                      _passwordField(),
                      SizedBox(height: 20),
                      _loginButton(context),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _forgotPassword(context),
                SizedBox(height: 20),
                _signUp(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login Page",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        Text(
          "insanberbagi",
          style: TextStyle(
            fontSize: 24,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.green.withOpacity(0.12),
        filled: true,
        prefixIcon: Icon(Icons.person, color: Colors.green),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.green.withOpacity(0.12),
        filled: true,
        prefixIcon: Icon(Icons.lock, color: Colors.green),
      ),
      obscureText: true,
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
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
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 16),
        shadowColor: Colors.black,
        elevation: 8,
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Widget _signUp(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't Have an Account?",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 2), 
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
}
