import 'package:booc/app_bar.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bucket List,", style: getH4()),
                Text("here are the books you saved for later.", style: getH6()),
              ],
            ),
          ),
          Expanded(
            child: BookGridView(
                dataBloc: widget.dataBloc, pageContext: PageContext.bucket),
          ),
        ],
      ),
    );
  }
}
