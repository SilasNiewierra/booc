import 'package:boek/model/book.dart';
import 'package:flutter/material.dart';
import '../data_bloc.dart';

class MenuScreen extends StatefulWidget {
  final DataBloc dataBloc;
  MenuScreen({@required this.dataBloc});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Book> allBooks = bookListDummy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'user-hero',
                  child: Image.asset(
                    'assets/images/user-icon.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Container(
                  height: 2.0,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Analyze",
                      style: Theme.of(context).textTheme.headline3),
                ),
                Container(
                  height: 2.0,
                  width: 50,
                  color: Colors.blueGrey[900],
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    widget.dataBloc.updateSignedInState(false);
                  },
                  child: Text("Logout",
                      style: Theme.of(context).textTheme.headline3),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.blueGrey[900],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
      backgroundColor: Colors.transparent,
    );
  }
}
