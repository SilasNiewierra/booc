import 'package:boek/data_bloc.dart';
import 'package:boek/detail/detail_screen.dart';
import './components/nav_drawer.dart';
import 'package:flutter/material.dart';
import '../model/book.dart';

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
      drawer: NavDrawer(
        dataBloc: widget.dataBloc,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/user-icon.png',
                    width: 50,
                    height: 50,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.blueGrey[600],
                    size: 30.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi Alex,",
                      style: Theme.of(context).textTheme.headline2),
                  Text("check out what you've read so far.",
                      style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),
            _buildReadBooks(),
            // _buildRecentBooks(),
            // _buildExploreBooks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new book to read list
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }

  Widget _buildReadBooks() {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (250 / 350),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(
          bookListDummy.length,
          (index) => _buildCoverBookItem(bookListDummy[index]),
        ),
      ),
    );
  }

  Widget _buildCoverBookItem(Book bookItem) {
    return Center(
      child: Container(
        height: 350,
        width: 250,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(bookItem: bookItem)),
            );
          },
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: bookItem.uniqueId,
                child: Image.asset(
                  'assets/images/' + bookItem.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
