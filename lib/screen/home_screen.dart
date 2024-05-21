import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:insanberbagi/components/berita.dart';
import 'package:insanberbagi/components/berita_terkini.dart';
import 'package:insanberbagi/models/news_model.dart';
import 'package:insanberbagi/screen/profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int activeIndex = 0;
  String? username;

  @override
  void initState() {
    super.initState();
    _fetchUsernameAndShowGreeting();
  }

  void _fetchUsernameAndShowGreeting() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        username = userDoc['username'] ?? 'Anonymous';
      });
      if (username != null) {
        _showGreetingSnackBar(username!);
      }
    }
  }

  void _showGreetingSnackBar(String username) {
    final snackBar = SnackBar(
      content: Text(
        'Hello $username!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text(
          "News Data",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Hot News",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: NewsData.breakingNewsData.length,
                itemBuilder: (context, index, id) =>
                    Berita(NewsData.breakingNewsData[index]),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                ),
              ),

              // Teks Berita Terkini
              SizedBox(height: 40.0),
              Text(
                "Berita Sosial Terkini",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // TabBar and TabBarView
              SizedBox(height: 20),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.green,
                      tabs: [
                        Tab(text: "Recent"),
                        Tab(text: "Popular"),
                        Tab(text: "Trending"),
                      ],
                    ),
                    SizedBox(
                      height: 510, // Adjust the height as needed
                      child: TabBarView(
                        children: [
                          Column(
                            children: NewsData.recentNewsData
                                .map((e) => Beritaterkini(e))
                                .toList(),
                          ),
                          Column(
                            children: NewsData.recentNewsData
                                .map((e) => Beritaterkini(e))
                                .toList(),
                          ),
                          Column(
                            children: NewsData.recentNewsData
                                .map((e) => Beritaterkini(e))
                                .toList(),
                          )
          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

