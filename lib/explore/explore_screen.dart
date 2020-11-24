import 'package:boek/detail/detail_screen.dart';
import 'package:boek/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../data_bloc.dart';

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
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.blueGrey[900],
          ),
          onPressed: () => Navigator.pop(context),
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.transparent,
          ),
          onPressed: null,
        ),
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
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w100),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.search)),
              ],
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (240 / 340),
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
        height: 340,
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
              // Container(
              //   width: 240,
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Flexible(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               bookItem.title,
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 1,
              //               softWrap: false,
              //               style: Theme.of(context).textTheme.headline4,
              //             ),
              //             Text(
              //               bookItem.author,
              //               overflow: TextOverflow.ellipsis,
              //               maxLines: 1,
              //               softWrap: false,
              //               style: Theme.of(context).textTheme.subtitle2,
              //             ),
              //           ],
              //         ),
              //       ),
              //       ValueListenableBuilder(
              //           valueListenable: bookItem.like,
              //           builder: (BuildContext ctx, bool like, Widget wdg) {
              //             return Icon(
              //               like ? Icons.favorite : Icons.favorite_border,
              //               color: Theme.of(context).accentColor,
              //             );
              //           }),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
