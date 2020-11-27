import 'package:booc/_variables.dart';
import 'package:booc/data_bloc.dart';
import 'package:booc/screens/detail/detail_screen.dart';
import 'package:booc/model/book.dart';
import 'package:booc/toast.dart';
import 'package:flutter/material.dart';

class BookGridView extends StatefulWidget {
  final DataBloc dataBloc;
  final PageContext pageContext;

  BookGridView({@required this.dataBloc, @required this.pageContext});
  @override
  _BookGridViewState createState() => _BookGridViewState();
}

class _BookGridViewState extends State<BookGridView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectContent(),
      builder: (BuildContext ctx, List<Book> bookList, Widget wdgt) {
        return bookList.length > 0
            ? Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (240 / 390),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  children: List.generate(
                    bookList.length,
                    (index) => _buildItem(bookList[index]),
                  ),
                ),
              )
            : buildEmptyBody(context, widget.pageContext);
      },
    );
  }

  ValueNotifier<List<Book>> _selectContent() {
    switch (widget.pageContext) {
      case PageContext.bucket:
        return widget.dataBloc.bucketBookItems;
      case PageContext.explore:
        return widget.dataBloc.exploreBookItems;
      case PageContext.home:
        return widget.dataBloc.readBookItems;
      default:
        return widget.dataBloc.readBookItems;
    }
  }

  Widget _buildItem(Book bookItem) {
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
                    _selectQuickAction(bookItem)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectQuickAction(Book bookItem) {
    switch (widget.pageContext) {
      case PageContext.bucket:
        return _buildQuickActionBucket(bookItem);
      case PageContext.explore:
        return _buildQuickActionExplore(bookItem);
      case PageContext.home:
        return _buildQuickActionHome(bookItem);
      default:
        return Container();
    }
  }

  Widget _buildQuickActionExplore(Book bookItem) {
    return ValueListenableBuilder(
        valueListenable: bookItem.read,
        builder: (BuildContext ctx, bool read, Widget wdg) {
          return IconButton(
            icon: Icon(
              read ? Icons.remove : Icons.add,
              color: defaultTextColor,
            ),
            onPressed: () {
              if (read) {
                bookItem.updateRead(false);
                widget.dataBloc.removeReadBook(bookItem);
                createToast(context,
                    "Removed \"" + bookItem.title + "\" from your read list");
              } else {
                bookItem.updateRead(true);
                widget.dataBloc.addReadBook(bookItem);
                createToast(context,
                    "Added \"" + bookItem.title + "\" to your read list");
              }
            },
          );
        });
  }

  Widget _buildQuickActionBucket(Book bookItem) {
    return IconButton(
      icon: Icon(
        Icons.remove,
      ),
      onPressed: () {
        bookItem.updateBucketed(false);
        widget.dataBloc.removeBucketBook(bookItem);
        createToast(context,
            "Removed \"" + bookItem.title + "\" from your Bucket List");
      },
    );
  }

  Widget _buildQuickActionHome(Book bookItem) {
    return ValueListenableBuilder(
        valueListenable: bookItem.like,
        builder: (BuildContext ctx, bool liked, Widget wdg) {
          return IconButton(
            icon: Icon(
              liked ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              if (liked) {
                bookItem.updateLiked(false);
              } else {
                bookItem.updateLiked(true);
              }
            },
          );
        });
  }
}

Widget buildEmptyBody(BuildContext context, PageContext pageContext) {
  return Flexible(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Image.asset(
            _selectEmptyImageAsset(pageContext),
            fit: BoxFit.fill,
            width: 500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            _selectEmptyText(pageContext),
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
}

String _selectEmptyText(PageContext pageContext) {
  switch (pageContext) {
    case PageContext.analytics:
      return "Seem's like you haven't read any books yet. You can only analyze read books.";
    case PageContext.bucket:
      return "Seem's like you haven't added any books to your Bucket List yet.";
    case PageContext.explore:
      return "Seem's like you don't have a network connection";
    case PageContext.home:
      return "Seem's like you haven't read any books yet. Add your first book now.";
    default:
      return "Seem's like you came here from an unknwon route";
  }
}

String _selectEmptyImageAsset(PageContext pageContext) {
  switch (pageContext) {
    case PageContext.analytics:
      return 'assets/images/no_analytics.png';
    case PageContext.bucket:
      return 'assets/images/no_bucket.png';
    case PageContext.explore:
      return 'assets/images/no_network.png';
    case PageContext.home:
      return 'assets/images/no_books.png';
    default:
      return 'assets/images/no_books.png';
  }
}

void filterSearchResults(
    String query, DataBloc dataBloc, PageContext pageContext) {
  List<Book> completeList = List<Book>();
  switch (pageContext) {
    case PageContext.bucket:
      completeList.addAll(dataBloc.bucketBooksList);
      break;
    case PageContext.explore:
      completeList.addAll(dataBloc.exploreBooksList);
      break;
    case PageContext.home:
      completeList.addAll(dataBloc.readBooksList);
      break;
    default:
      completeList.addAll(dataBloc.readBooksList);
      break;
  }
  print("completeList for query: " + query);
  completeList.forEach((element) => print(element.title));
  if (query.isNotEmpty) {
    List<Book> searchResultList = List<Book>();
    completeList.forEach((item) {
      if (item.title.toLowerCase().contains(query.toLowerCase()) ||
          item.author.toLowerCase().contains(query.toLowerCase())) {
        searchResultList.add(item);
      }
    });
    print("searchResultList: ");
    searchResultList
        .forEach((element) => print(element.title + element.author));
    dataBloc.setBookItems(searchResultList, pageContext);
  } else {
    dataBloc.setBookItems(completeList, pageContext);
  }
}
