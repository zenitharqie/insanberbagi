import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Sign up with email and password
  Future<User?> signupWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Sign in with email and password
  Future<User?> signinWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Get current user UID
  String? getCurrentUserUid() {
    return _auth.currentUser?.uid;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get user details from Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    String? uid = getCurrentUserUid();
    if (uid != null) {
      return await _firestore.collection("users").doc(uid).get();
    } else {
      throw Exception("No user is signed in");
    }
  }

  // Update user data in Firestore
  Future<void> changeUserData(String field, String newValue) async {
    String? uid = getCurrentUserUid();
    if (uid != null) {
      await _firestore.collection('users').doc(uid).update({
        field: newValue,
      });
    } else {
      throw Exception("No user is signed in");
    }
  }

  // Upload profile picture to Firebase Storage and update Firestore
  Future<void> uploadProfilePicture(File image) async {
    try {
      String? uid = getCurrentUserUid();
      if (uid != null) {
        Reference storageRef = _storage.ref().child('profile_pictures').child(uid);
        UploadTask uploadTask = storageRef.putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadURL = await taskSnapshot.ref.getDownloadURL();

        await _firestore.collection('users').doc(uid).update({
          'photoURL': downloadURL,
        });
      } else {
        throw Exception("No user is signed in");
      }
    } catch (e) {
      print("Error uploading profile picture: $e");
      throw e;
    }
  }
}
