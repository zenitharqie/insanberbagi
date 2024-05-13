import 'package:flutter/material.dart';
import 'package:insanberbagi/models/news_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class beritaterkini extends StatefulWidget {
  beritaterkini(this.data, {Key? key}) : super(key:key);
  NewsData data;
  @override
  State<beritaterkini> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<beritaterkini> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom:20),
        padding: EdgeInsets.all(12),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(26)
        ),

    child: Row(
      children: [
        Flexible(
          flex: 3,
          child: Container(
          height: 100,
          decoration: 
          BoxDecoration(
            borderRadius: BorderRadius.circular(16) ,
            image: 
            DecorationImage(
              image: NetworkImage(widget.data.urlToImage!),
              fit: BoxFit.fitHeight
              )
            ),
          ),
        ),

        SizedBox(
          width: 10,
        ),

        Flexible(
          flex: 5,
          child: Column(
            children: [
              Text(widget.data.title!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
          SizedBox(height: 8),
          Text(widget.data.content!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black))
            ]
          )
        )
      ],
    ),
  );
}
}