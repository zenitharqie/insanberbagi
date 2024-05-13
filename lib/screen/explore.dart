import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:insanberbagi/components/berita.dart';
import 'package:insanberbagi/components/berita_terkini.dart';
import 'package:insanberbagi/models/charity_model.dart';
import 'package:insanberbagi/models/news_model.dart';
import 'package:insanberbagi/screen/profile.dart';
import 'package:insanberbagi/components/charity.dart';


void main() {
  runApp(Explore());
}

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text("Charity Progress",
        style: TextStyle(color: Colors.black),),
        actions: [IconButton(onPressed: (){}, 
          icon: Icon(Icons.notifications_outlined, 
          color: Colors.black,))],
        ),
        body: 
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Column(children: CharityData.recentNewsData.map((e) => Charity(e)).toList())     
              ],
            ),),
        )
      )
    );
  }
}
