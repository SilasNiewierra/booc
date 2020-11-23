import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Back To Home"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
