import 'package:booc/data_bloc.dart';
import 'package:booc/_variables.dart';
import 'package:booc/book_grid_view.dart';
import 'package:flutter/material.dart';

class BucketListScreen extends StatefulWidget {
  final DataBloc dataBloc;

  BucketListScreen({this.dataBloc});

  @override
  _BucketListScreenState createState() => _BucketListScreenState();
}

class _BucketListScreenState extends State<BucketListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context, widget.dataBloc, "Bucket List", PageContext.bucket),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: BookGridView(
        dataBloc: widget.dataBloc,
        pageContext: PageContext.bucket,
      ),
    );
  }
}
