import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './components/body.dart';
import '../model/book.dart';

class DetailScreen extends StatefulWidget {
  final Book bookItem;

  DetailScreen({this.bookItem});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(),
      body: Body(bookItem: widget.bookItem),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [],
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
