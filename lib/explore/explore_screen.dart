import 'package:boek/detail/detail_screen.dart';
import 'package:boek/model/book.dart';
import 'package:boek/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../data_bloc.dart';
import '../theme_variables.dart';

class ExploreScreen extends StatefulWidget {
  final DataBloc dataBloc;
  ExploreScreen({@required this.dataBloc});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Book> allBooks = bookListDummy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildExploreBooks());
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: defaultTextColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // IconButton(
        //   icon: SvgPicture.asset(
        //     'assets/icons/back.svg',
        //     color: Colors.transparent,
        //   ),
        //   onPressed: null,
        // ),
      ]),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildExploreBooks() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Search by Title or Author...",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: defaultTextColor, fontWeight: FontWeight.w100),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.search,
                      color: defaultTextColor,
                    )),
              ],
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (240 / 390),
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              children: List.generate(
                allBooks.length,
                (index) => _buildCoverBookItem(allBooks[index]),
              ),
            ),
          ),
        ],
      ),
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
                        valueListenable: bookItem.read,
                        builder: (BuildContext ctx, bool read, Widget wdg) {
                          return IconButton(
                            icon: Icon(
                              read ? Icons.remove : Icons.add,
                              // color: Theme.of(context).accentColor,
                            ),
                            onPressed: () {
                              if (read) {
                                bookItem.updateRead(false);
                                widget.dataBloc.removeReadBook(bookItem);
                                createToast(
                                    context,
                                    "Removed \"" +
                                        bookItem.title +
                                        "\" from your read list");
                              } else {
                                bookItem.updateRead(true);
                                widget.dataBloc.addReadBook(bookItem);
                                createToast(
                                    context,
                                    "Added \"" +
                                        bookItem.title +
                                        "\" to your read list");
                              }
                            },
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
