import 'package:flutter/material.dart';
import 'package:insanberbagi/components/berita.dart';
import 'package:insanberbagi/components/berita_terkini.dart';
import 'package:insanberbagi/models/charity_model.dart';
import 'package:insanberbagi/models/news_model.dart';
import 'package:insanberbagi/screen/profile.dart';
import 'package:insanberbagi/components/charity_detail.dart';


class Charity extends StatefulWidget {
  Charity(this.data, {Key? key}) : super(key: key);
  final CharityData data;

  @override
  State<Charity> createState() => _CharityState();
}

class _CharityState extends State<Charity> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Charitydetail()),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(12),
        height: 200, 
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(widget.data.urlToImage!),
                    fit: BoxFit.fitHeight,
                    
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title!,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.data.content!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: widget.data.progress / 100,
                          backgroundColor: Colors.black,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${widget.data.progress}%', // Display progress text
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${widget.data.uang}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


