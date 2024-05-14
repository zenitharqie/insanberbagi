import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> singupWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error");
    }
    return null;
  }

  // Future<User?> singinWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     UserCredential credential = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     return credential.user;
  //   } catch (e) {
  //     print("Error");
  //   }
  //   return null;
  // }

  // get current user uid
  String? getCurrentUserUid() {
    return _auth.currentUser!.uid;
  }

  // signout
  Future<void> signOut() async {
    await _auth.signOut();
  }


  // getall data from users storage that have uid == current user
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(getCurrentUserUid())
        .get();
  }

  Future<void> changeUserData(String field, newValue) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(getCurrentUserUid())
        .update({
      field: newValue,
    });
  }

  // update user data
}
