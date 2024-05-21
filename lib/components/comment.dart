import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
  final String postId;

  const CommentSection({Key? key, required this.postId}) : super(key: key);

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();
  final CollectionReference commentsCollection =
      FirebaseFirestore.instance.collection('comments');
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  Future<void> _addComment() async {
    if (_commentController.text.isNotEmpty && user != null) {
      try {
        DocumentSnapshot userDoc = await usersCollection.doc(user!.uid).get();
        String username = userDoc.get('username') ?? 'Anonymous';

        await commentsCollection.add({
          'text': _commentController.text,
          'name': username,
          'timestamp': FieldValue.serverTimestamp(),
          'postId': widget.postId,
        });
        _commentController.clear();
        print("Comment added successfully");
      } catch (e) {
        print("Error adding comment: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            controller: _commentController,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Tulis Komentar...',
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: _addComment,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text('Comment', style: TextStyle(fontSize: 16)),
          ),
        ),
        SizedBox(height: 25),
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
                'Comments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: commentsCollection
                    .where('postId', isEqualTo: widget.postId)
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    print("Error fetching comments: ${snapshot.error}");
                    return Center(child: Text('Error fetching comments'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    print("No comments yet");
                    return Center(child: Text('No comments yet.'));
                  }
                  print("Comments fetched: ${snapshot.data!.docs.length}");
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var commentData = snapshot.data!.docs[index];
                      var commentText = commentData['text'];
                      var commentName = commentData['name'];
                      var commentTimestamp =
                          commentData['timestamp'] as Timestamp?;
                      var commentTime = commentTimestamp != null
                          ? DateTime.fromMillisecondsSinceEpoch(
                              commentTimestamp.millisecondsSinceEpoch)
                          : null;
                      var formattedTime = commentTime != null
                          ? "${commentTime.day}/${commentTime.month}/${commentTime.year} ${commentTime.hour}:${commentTime.minute}"
                          : "Unknown time";

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(commentName,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(commentText),
                            SizedBox(height: 5),
                            Text(formattedTime,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

