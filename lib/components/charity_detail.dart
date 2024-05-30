import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CharityDetail extends StatefulWidget {
  const CharityDetail({Key? key}) : super(key: key);

  @override
  _CharityDetailState createState() => _CharityDetailState();
}

class _CharityDetailState extends State<CharityDetail> {
  int likes = 0;
  final TextEditingController _donationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchLikes();
  }

  Future<void> _fetchLikes() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('utility').doc('charity').get();

    setState(() {
      likes = snapshot.data()?['like'] ?? 0;
    });
  }

  Future<void> _likeCharity() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final DocumentReference _charityRef =
        _firestore.collection('utility').doc('charity');

    try {
      await _charityRef.update({'like': FieldValue.increment(1)});
      setState(() {
        likes++;
      });
    } catch (e) {
      print('Error liking charity: $e');
    }
  }

  Future<void> _donate() async {
    final String donationAmount = _donationController.text;

    if (donationAmount.isEmpty) {
      print("Donation amount cannot be empty");
      return;
    }

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final DocumentReference _charityRef =
        _firestore.collection('utility').doc('charity');

    try {
      await _charityRef.update({
        'donations': FieldValue.increment(int.parse(donationAmount))
      });
      _donationController.clear();
      print("Donation successful");
    } catch (e) {
      print('Error donating: $e');
    }
  }

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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://kitabisa.com/_next/image?url=https%3A%2F%2Fimgix.kitabisa.com%2Fbae857c6-7a79-448a-8161-9b39ecac6ebc.jpg%3Fauto%3Dformat%26fm%3Dpjpg%26ch%3DWidth%2CDPR%2CSave-Data%2CViewport-Width&w=1080&q=75",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pahala 2x Lipat! Sedekah Ifthar Tuk Yatim dan Dhuafa",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Rp80.000.000",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Terkumpul dari Rp100.000.000",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    LinearProgressIndicator(
                      value: 80 / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _likeCharity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.thumb_up),
                              SizedBox(width: 5),
                              Text('Like'),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Likes: $likes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDescriptionText(
                        'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDescriptionText(
                        'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.'),
                    _buildDescriptionText(
                        'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.'),
                    _buildDescriptionText(
                        'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.'),
                    _buildDescriptionText(
                        'Siapa memberi makan orang yang berpuasa, maka baginya pahala seperti orang yang berpuasa tersebut, tanpa mengurangi pahala orang yang berpuasa itu sedikit pun juga.'),
                    SizedBox(height: 20),
                    TextField(
                      controller: _donationController,
                      decoration: InputDecoration(
                        labelText: 'Jumlah Donasi...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        fillColor: Colors.green[50],
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _donate,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        ),
                        child: Text(
                          'Donate',
                          
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16),
                        ),
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

  Widget _buildStatistic(String value, String label) {
    return Container(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}

