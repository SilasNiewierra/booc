import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  final item;

  BookDetail({this.item});

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("Hallo Buch"),
              Hero(
                tag: widget.item[0],
                child: Image.asset(
                  'assets/images/' + widget.item[1],
                  fit: BoxFit.fill,
                ),
              ),
              RaisedButton(
                child: Text("Back To Home"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
