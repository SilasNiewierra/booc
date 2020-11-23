import 'package:boek/data_bloc.dart';
import 'package:boek/nav_drawer.dart';
import 'package:flutter/material.dart';

import 'book_detail.dart';

class Home extends StatefulWidget {
  final DataBloc dataBloc;

  Home({@required this.dataBloc});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List readBookDummy = [
    ['r0', 'book-0.jpeg', 'Die Sonnenschwester', 'Lucinda Riley'],
    ['r1', 'book-1.jpeg', 'Auf silberner Fährte', 'Cornelia Funke'],
    ['r2', 'book-2.jpeg', 'Der Ickaborg', 'J. K. Rowling'],
    ['r3', 'book-3.jpeg', 'A promised land', 'Barack Obama'],
  ];

  List exploreBookDummy = [
    ['e0', 'book-burnt.jpeg', 'Burnt Sugar', 'Avni Doshi'],
    ['e1', 'book-chanel.jpeg', 'Chanel', 'Thomas Hudson'],
    ['e2', 'book-halsey.jpeg', 'I Would leave my body if I could', 'Halsey'],
    ['e3', 'book-milk.jpeg', 'Milk and honey', 'Rupi Kaur'],
    ['e4', 'book-shadow.jpeg', 'The shadow king', 'Maaza Mengiste'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        dataBloc: widget.dataBloc,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
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
            _buildRecentBooks(),
            _buildExploreBooks(),
            // RaisedButton(
            //     child: Text("Route Placeholder"),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => BookDetail()),
            //       );
            //     }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        // label: Text('I read a new book'),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }

  Widget _buildRecentBooks() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Read Books",
            style: Theme.of(context).textTheme.headline3,
          ),
          Container(
            height: 400.0,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: readBookDummy.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) =>
                  _buildBookItem(readBookDummy[index]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildExploreBooks() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore New Books",
            style: Theme.of(context).textTheme.headline3,
          ),
          Container(
            height: 400.0,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: exploreBookDummy.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (BuildContext context, int index) =>
                  _buildBookItem(exploreBookDummy[index]),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBookItem(var bookItem) {
    return Container(
      // margin: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookDetail(item: bookItem)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: bookItem[0],
                  child: Image.asset(
                    'assets/images/' + bookItem[1],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              width: 250,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookItem[2],
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        bookItem[3],
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
