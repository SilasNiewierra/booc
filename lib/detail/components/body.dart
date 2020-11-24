import 'package:boek/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/book.dart';

class Body extends StatefulWidget {
  final Book bookItem;
  final DataBloc dataBloc;

  Body({Key key, @required this.dataBloc, this.bookItem}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.4),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category: " + widget.bookItem.category,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          ValueListenableBuilder(
                            valueListenable: widget.bookItem.like,
                            builder: (BuildContext ctx, bool like, Widget wdg) {
                              return IconButton(
                                icon: Icon(
                                  like ? Icons.favorite : Icons.favorite_border,
                                  color: Theme.of(context).accentColor,
                                  size: 35.0,
                                ),
                                onPressed: () {
                                  widget.bookItem.updateRating(!like);
                                },
                              );
                            },
                          ),
                        ],
                      ),

                      // Trick to keep 100% width
                      SizedBox(
                        width: size.width,
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Text(
                          descriptionDummy,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share,
                                color: Theme.of(context).accentColor),
                          ),
                          ValueListenableBuilder(
                            valueListenable: widget.bookItem.read,
                            builder: (BuildContext ctx, bool read, Widget wdg) {
                              return FlatButton(
                                onPressed: () {
                                  if (read) {
                                    widget.bookItem.updateRead(false);
                                    widget.dataBloc
                                        .removeReadBook(widget.bookItem);
                                    _createToast("Removed \"" +
                                        widget.bookItem.title +
                                        "\" from your list");
                                  } else {
                                    widget.bookItem.updateRead(true);
                                    widget.dataBloc
                                        .addReadBook(widget.bookItem);
                                    _createToast("Added \"" +
                                        widget.bookItem.title +
                                        "\" to your list");
                                  }
                                },
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        width: 2,
                                        color: Theme.of(context).accentColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(read ? "Remove" : 'Add',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700)),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.bookItem.author,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      widget.bookItem.title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.15),
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 350,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Hero(
                          tag: widget.bookItem.uniqueId,
                          child: Image.asset(
                            'assets/images/' + widget.bookItem.imgUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
