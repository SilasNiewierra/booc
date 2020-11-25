import 'package:boek/data_bloc.dart';
import 'package:boek/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/book.dart';
import '../../theme_variables.dart';

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.bookItem.author,
                      style: TextStyle(color: detailTextColor),
                    ),
                    Text(
                      widget.bookItem.title,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: detailTextColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category: " + widget.bookItem.category,
                            style: Theme.of(context).textTheme.headline5,
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
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Text(
                          descriptionDummy,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30.0),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            child: IconButton(
                              iconSize: 35,
                              icon: Icon(Icons.add,
                                  color: Theme.of(context).accentColor),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 60,
                              child: ValueListenableBuilder(
                                valueListenable: widget.bookItem.read,
                                builder:
                                    (BuildContext ctx, bool read, Widget wdg) {
                                  return FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    color: Theme.of(context).accentColor,
                                    onPressed: () {
                                      if (read) {
                                        widget.bookItem.updateRead(false);
                                        widget.dataBloc
                                            .removeReadBook(widget.bookItem);
                                        createToast(
                                            context,
                                            "Removed \"" +
                                                widget.bookItem.title +
                                                "\" from your read list");
                                      } else {
                                        widget.bookItem.updateRead(true);
                                        widget.dataBloc
                                            .addReadBook(widget.bookItem);
                                        createToast(
                                            context,
                                            "Added \"" +
                                                widget.bookItem.title +
                                                "\" to your read list");
                                      }
                                    },
                                    child: Text(
                                      read
                                          ? "Unread".toUpperCase()
                                          : 'Read'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              color: detailTextColor,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
}
