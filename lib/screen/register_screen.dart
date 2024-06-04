import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insanberbagi/widget/navbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  var db = FirebaseFirestore.instance;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInputFields(context),
            SizedBox(height: 30),
            _buildRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            controller: _nameController,
            hintText: "Name",
            prefixIcon: Icons.person,
          ),
          SizedBox(height: 10),
          _buildTextField(
            controller: _emailController,
            hintText: "Email",
            prefixIcon: Icons.email,
          ),
          SizedBox(height: 10),
          _buildTextField(
            controller: _phoneController,
            hintText: "Phone Number",
            prefixIcon: Icons.phone,
          ),
          SizedBox(height: 10),
          _buildTextField(
            controller: _addressController,
            hintText: "Address",
            prefixIcon: Icons.location_on,
          ),
          SizedBox(height: 10),
          _buildTextField(
            controller: _passwordController,
            hintText: "Password",
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(height: 10),
          _buildTextField(
            controller: _confirmPasswordController,
            hintText: "Confirm Password",
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.green,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.green),
        ),
        filled: true,
        fillColor: Colors.green.withOpacity(0.12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        if (hintText == "Password" && value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        if (hintText == "Confirm Password" && value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text)
              .then((value) {
            db.collection("users").doc(value.user!.uid).set({
              "email": _emailController.text,
              "username": _nameController.text,
              "phone": _phoneController.text,
              "address": _addressController.text,
            });
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Navbar()),
              (route) => false,
            );
          }).catchError((error) {
            print("Error: $error");
          });
        }
      },
      child: Text(
        "Register",
        style: TextStyle(
            fontSize: 20, color: Colors.white), 
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.green,
      ),
    );
  }
}
