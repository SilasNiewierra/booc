import 'package:booc/_variables.dart';
import 'package:booc/data_bloc.dart';
import 'package:booc/book_grid_view.dart';
import 'package:booc/screens/explore/explore_screen.dart';
import 'package:booc/screens/menu/menu.dart';
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
      appBar: _buildAppBar(),
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

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MenuScreen(dataBloc: widget.dataBloc)),
              ),
              child: Icon(
                Icons.menu,
                color: defaultTextColor,
                size: 30.0,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: defaultTextColor,
                size: 30.0,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
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
                Text("Hi Alex,",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: defaultTextColor)),
                Text("check out what you've read so far.",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: defaultTextColor)),
              ],
            ),
          ),
          BookGridView(
              dataBloc: widget.dataBloc, pageContext: PageContext.home),
        ],
      ),
    );
  }
}
