import 'package:booc/data_bloc.dart';
import 'package:booc/_variables.dart';
import 'package:booc/book_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: defaultTextColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Hero(
            tag: 'bucket',
            child: Text(
              "Bucket List",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: defaultTextColor),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.transparent,
            ),
            onPressed: null,
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
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
