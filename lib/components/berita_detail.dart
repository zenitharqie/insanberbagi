import 'package:flutter/material.dart';
import 'package:insanberbagi/models/news_model.dart';
import 'comment.dart'; // Import the CommentSection
import 'package:cloud_firestore/cloud_firestore.dart';

class Beritadetail extends StatefulWidget {
  final NewsData data;

  const Beritadetail({Key? key, required this.data}) : super(key: key);

  @override
  _BeritadetailState createState() => _BeritadetailState();
}

class _BeritadetailState extends State<Beritadetail> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(widget.data.urlToImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                widget.data.title!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.data.author!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                
              ),
              SizedBox(height: 16.0),
              Text(
                'Dalam kehidupan masyarakat yang dinamis, interaksi akan selalu terjadi. Interaksi muncul di tengah-tengah masyarakat yang hidup secara bersama. Interaksi itu disebut sebagai interaksi sosial. Apa itu interaksi sosial? Interaksi sosial adalah sebuah proses ketika orang-orang saling berkomunikasi dan memengaruhi satu sama lain. Ketika berinteraksi, akan terjadi pertukaran ide dan gagasan di antara orang yang sedang berkomunikasi.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                'Dalam kehidupan masyarakat yang dinamis, interaksi akan selalu terjadi. Interaksi muncul di tengah-tengah masyarakat yang hidup secara bersama. Interaksi itu disebut sebagai interaksi sosial. Apa itu interaksi sosial? Interaksi sosial adalah sebuah proses ketika orang-orang saling berkomunikasi dan memengaruhi satu sama lain. Ketika berinteraksi, akan terjadi pertukaran ide dan gagasan di antara orang yang sedang berkomunikasi.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 16.0),
              CommentSection(postId: widget.data.title!) 
            ],
          ),
        ),
      ),
    );
  }
}
