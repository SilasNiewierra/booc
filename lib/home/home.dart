import 'package:boek/data_bloc.dart';
import 'package:boek/detail/detail_screen.dart';
import 'package:boek/explore/explore_screen.dart';
import 'package:boek/menu/menu.dart';
import 'package:flutter/material.dart';
import '../model/book.dart';
import '../theme_variables.dart';

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
        // backgroundColor: Theme.of(context).accentColor,
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

  Widget _buildReadBooks() {
    return ValueListenableBuilder(
      valueListenable: widget.dataBloc.readBooks,
      builder: (BuildContext ctx, List<Book> readBooksList, Widget wdgt) {
        Size size = MediaQuery.of(context).size;
        return readBooksList.length > 0
            ? Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (240 / 390),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Image.asset(
                        'assets/images/no_books.png',
                        fit: BoxFit.fill,
                        width: size.width,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Seem's like you haven't read any books yet. Add your first book now.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: disabledTextColor,
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
        width: 240,
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
                width: 240,
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
                width: 240,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookItem.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: defaultTextColor),
                          ),
                          Text(
                            bookItem.author,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: defaultLightTextColor),
                          ),
                        ],
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: bookItem.like,
                        builder: (BuildContext ctx, bool like, Widget wdg) {
                          return Icon(
                            like ? Icons.favorite : Icons.favorite_border,
                            // color: Theme.of(context).accentColor,
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
