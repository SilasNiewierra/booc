import 'package:flutter/material.dart';
import '../../model/book.dart';

class Body extends StatefulWidget {
  final Book bookItem;

  Body({Key key, this.bookItem}) : super(key: key);

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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.bookItem.read
                              ? RaisedButton(
                                  onPressed: () {
                                    widget.bookItem.updateRead(false);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Remove",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100)),
                                  ),
                                )
                              : RaisedButton(
                                  onPressed: () {
                                    widget.bookItem.updateRead(true);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Add",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100)),
                                  ),
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
                        color: Colors.teal,
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
