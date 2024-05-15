import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insanberbagi/screen/login_screen.dart';
import 'package:insanberbagi/user_auth/firebase_auth/firebase_auth_service.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: _firebaseAuthService.getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                var data = snapshot.data as dynamic;

                return Column(
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/insanberbagi.png'),
                    ),
                    const SizedBox(height: 20),
                    itemProfile(
                        'Name', data['username'], CupertinoIcons.person),
                    const SizedBox(height: 10),
                    itemProfile('Phone', data['phone'], CupertinoIcons.phone),
                    const SizedBox(height: 10),
                    itemProfile(
                        'Address', data['address'], CupertinoIcons.location),
                    const SizedBox(height: 10),
                    itemProfile('Email', data['email'], CupertinoIcons.mail),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          signOut(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text('Log Out'),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }

  void signOut(BuildContext context) {
    _firebaseAuthService.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  // update item on profile
}

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: _firebaseAuthService.getUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                var data = snapshot.data as dynamic;

                return Column(
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage('assets/images/insanberbagi.png'),
                    ),
                    const SizedBox(height: 20),
                    itemProfile('Name', data['username'], CupertinoIcons.person,
                        _nameController),
                    const SizedBox(height: 10),
                    itemProfile('Phone', data['phone'], CupertinoIcons.phone,
                        _phoneController),
                    const SizedBox(height: 10),
                    itemProfile('Address', data['address'],
                        CupertinoIcons.location, _addressController),
                    const SizedBox(height: 10),
                    itemProfile('Email', data['email'], CupertinoIcons.mail,
                        _emailController),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // if empty dont save
                          if (_nameController.text.isNotEmpty) {
                            _firebaseAuthService.changeUserData(
                                'username', _nameController.text);
                          }
                          if (_phoneController.text.isNotEmpty) {
                            _firebaseAuthService.changeUserData(
                                'phone', _phoneController.text);
                          }
                          if (_addressController.text.isNotEmpty) {
                            _firebaseAuthService.changeUserData(
                                'address', _addressController.text);
                          }

                          // reload the page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text('Save Changes'),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData,
      TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(iconData),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: subtitle,
                    ),
                    onChanged: (value) {
                      // Handle the input change
                    },
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}
