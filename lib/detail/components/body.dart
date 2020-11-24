import 'package:flutter/material.dart';
import '../../model/book.dart';

class Body extends StatefulWidget {
  final Book bookItem;

  Body({this.bookItem});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              width: 250,
              height: 350,
              child: Hero(
                tag: widget.bookItem.uniqueId,
                child: Image.asset(
                  'assets/images/' + widget.bookItem.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
