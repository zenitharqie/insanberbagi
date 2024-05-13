import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier{

  signup(String email, String password) async {
    Uri url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[AIzaSyCP2xZou_X_z00_VrWEPy10LVGNwTAMHME]");  

    var response = await http.post(
      url, 
      body: json.encode({
      "email": email,
      "password": password,
      "returnSecureToken": true,
    }));
    print(json.decode(response.body));
  }
}
