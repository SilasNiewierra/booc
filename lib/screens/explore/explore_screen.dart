import 'package:booc/_variables.dart';
import 'package:booc/book_grid_view.dart';
import 'package:booc/data_bloc.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  final DataBloc dataBloc;
  ExploreScreen({@required this.dataBloc});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // final List<Book> allBooks = bookListDummy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            context, widget.dataBloc, "Find New Books", PageContext.explore),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: BookGridView(
        dataBloc: widget.dataBloc,
        pageContext: PageContext.explore,
      ),
    );
  }
}
