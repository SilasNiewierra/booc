import 'package:boek/data_bloc.dart';
import 'package:boek/detail/detail_screen.dart';
import 'package:boek/explore/explore_screen.dart';
import 'package:boek/menu/menu.dart';
import 'package:hexcolor/hexcolor.dart';
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
      appBar: AppBar(
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
                child: Hero(
                  tag: 'user-hero',
                  child: Image.asset(
                    'assets/images/user-icon.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.blueGrey[600],
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
                      style: Theme.of(context).textTheme.headline2),
                  Text("check out what you've read so far.",
                      style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),
            _buildReadBooks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExploreScreen(dataBloc: widget.dataBloc)),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }

  Widget _buildReadBooks() {
    return ValueListenableBuilder(
      valueListenable: widget.dataBloc.readBooks,
      builder: (BuildContext ctx, List<Book> readBooksList, Widget wdgt) {
        return readBooksList.length > 0
            ? Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (250 / 390),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  children: List.generate(
                    readBooksList.length,
                    (index) => _buildCoverBookItem(readBooksList[index]),
                  ),
                ),
              )
            : Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/no_books.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Seem's like you haven't added any books yet. Add your first book now.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: HexColor('#B1B1B1'),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget _buildCoverBookItem(Book bookItem) {
    return Center(
      child: Container(
        height: 390,
        width: 250,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                      dataBloc: widget.dataBloc, bookItem: bookItem)),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 340,
                width: 250,
                decoration: BoxDecoration(
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
              Container(
                width: 250,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookItem.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          bookItem.author,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    ValueListenableBuilder(
                        valueListenable: bookItem.like,
                        builder: (BuildContext ctx, bool like, Widget wdg) {
                          return Icon(
                            like ? Icons.favorite : Icons.favorite_border,
                            color: Theme.of(context).accentColor,
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
