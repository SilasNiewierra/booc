import 'package:booc/_variables.dart';
import 'package:booc/app_bar.dart';
import 'package:booc/data_bloc.dart';
import 'package:booc/book_grid_view.dart';
import 'package:booc/screens/explore/explore_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final DataBloc dataBloc;

  Home({@required this.dataBloc});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, widget.dataBloc, "", PageContext.home),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExploreScreen(dataBloc: widget.dataBloc)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      // child: BookGridView(
      //     dataBloc: widget.dataBloc, pageContext: PageContext.home),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi You,", style: getH4()),
                Text("check out what you've read so far.", style: getH6()),
              ],
            ),
          ),
          Expanded(
            child: BookGridView(
                dataBloc: widget.dataBloc, pageContext: PageContext.home),
          ),
        ],
      ),
    );
  }
}
