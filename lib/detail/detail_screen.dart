import 'package:boek/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './components/body.dart';
import '../model/book.dart';

class DetailScreen extends StatefulWidget {
  final Book bookItem;
  final DataBloc dataBloc;

  DetailScreen({@required this.dataBloc, this.bookItem});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(),
      body: Body(dataBloc: widget.dataBloc, bookItem: widget.bookItem),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.blueGrey[900],
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [],
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
