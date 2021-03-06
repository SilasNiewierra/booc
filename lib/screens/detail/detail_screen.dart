import 'package:booc/data_bloc.dart';
import 'package:booc/_variables.dart';
import 'package:booc/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'body.dart';

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
      backgroundColor: widget.dataBloc.colorPaletteMap.isNotEmpty
          ? widget.dataBloc.colorPaletteMap[widget.bookItem.uniqueId].color
          : Theme.of(context).accentColor,
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
          color: detailTextColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [],
      backgroundColor: widget.dataBloc.colorPaletteMap.isNotEmpty
          ? widget.dataBloc.colorPaletteMap[widget.bookItem.uniqueId].color
          : Theme.of(context).accentColor,
    );
  }
}
