import 'package:flutter/material.dart';

class Charitydetail extends StatelessWidget {
  const Charitydetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charity Detail'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(4, 3),
            ),
          ], borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://kitabisa.com/_next/image?url=https%3A%2F%2Fimgix.kitabisa.com%2Fbae857c6-7a79-448a-8161-9b39ecac6ebc.jpg%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pahala 2x Lipat! Sedekah Ifthar Tuk Yatim dan Dhuafa",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Rp80.000.000", style: TextStyle(color: Colors.black)),
                    Text("Terkumpul dari Rp100.000.000"),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 80 / 100,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    SizedBox(height: 20),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Container(
                        child:Column(
                          children: [
                            Row(
                              children: [
                                Container(child: Text("4000"
                                ),
                                margin: EdgeInsets.only(left: 5))
                              ],
                            ),
                            SizedBox(height: 5),
                            Text("Orang Sudah Berdonasi")
                          ],
                        )
                      ),

                    ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.',
                      style: TextStyle(fontSize: 16),
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
