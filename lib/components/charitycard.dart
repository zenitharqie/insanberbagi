import 'package:flutter/material.dart';
import 'package:insanberbagi/models/charity_model.dart';

class CharityCard extends StatelessWidget {
  final CharityData charity;

  const CharityCard({Key? key, required this.charity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (charity.urlToImage != null) 
              Image.network(
                charity.urlToImage!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 10),
            Text(
              charity.title ?? 'No Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              charity.author ?? 'Unknown Author',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 5),
            Text(
              charity.content ?? 'No Description',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 5),
            Text(
              charity.uang ?? 'Rp 0',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 5),
            LinearProgressIndicator(
              value: charity.progress / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
