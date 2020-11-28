import 'package:booc/_variables.dart';
import 'package:booc/data_bloc.dart';
import 'package:booc/model/book.dart';
import 'package:booc/toast.dart';
import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: getDeviceHeight()),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            // Title and Author
            _buildHeading(),
            // Content
            _buildContent(getDeviceHeight()),
            // Cover Image
            _buildCover(getDeviceHeight()),
          ],
        ),
      ),
    ));
  }

  Widget _buildHeading() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.bookItem.author,
            style: getBody1(),
          ),
          Text(
            widget.bookItem.title,
            style: getH4()
                .copyWith(color: detailTextColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(double height) {
    return Container(
      margin: EdgeInsets.only(top: ((height / 2.7) + (height * 0.15) - 50)),
      padding: EdgeInsets.symmetric(horizontal: getDefaultHorizontalPadding()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category and Like
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category: " + widget.bookItem.category,
                  style: getH5(),
                ),
                ValueListenableBuilder(
                  valueListenable: widget.bookItem.like,
                  builder: (BuildContext ctx, bool like, Widget wdg) {
                    return IconButton(
                      icon: Icon(
                        like ? Icons.favorite : Icons.favorite_border,
                        color: widget.dataBloc.colorPaletteMap.isNotEmpty
                            ? widget.dataBloc
                                .colorPaletteMap[widget.bookItem.uniqueId].color
                            : Theme.of(context).accentColor,
                        size: 35.0,
                      ),
                      onPressed: () {
                        widget.bookItem.updateLiked(!like);
                      },
                    );
                  },
                ),
              ],
            ),
            // Description
            Container(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                widget.bookItem.description,
                style: getDescriptionStyle(),
              ),
            ),
            // Bottom Buttons
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: Row(
                children: [
                  ValueListenableBuilder(
                      valueListenable: widget.bookItem.read,
                      builder: (BuildContext bctx, bool read, Widget wdgt) {
                        return Container(
                          margin: EdgeInsets.only(right: 30.0),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: read
                                  ? Colors.grey
                                  : widget.dataBloc.colorPaletteMap.isNotEmpty
                                      ? widget
                                          .dataBloc
                                          .colorPaletteMap[
                                              widget.bookItem.uniqueId]
                                          .color
                                      : Theme.of(context).accentColor,
                            ),
                          ),
                          child: ValueListenableBuilder(
                              valueListenable: widget.bookItem.bucketed,
                              builder:
                                  (BuildContext ctx, bool marked, Widget wdg) {
                                return FlatButton(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  onPressed: read
                                      ? null
                                      : () {
                                          if (marked) {
                                            widget.dataBloc.removeBucketBook(
                                                widget.bookItem);
                                            createToast(context,
                                                "Removed from your Bucket List");
                                          } else {
                                            widget.dataBloc
                                                .addBucketBook(widget.bookItem);
                                            createToast(context,
                                                "Added to you Bucket List");
                                          }
                                        },
                                  child: Center(
                                    child: Icon(
                                      marked ? Icons.remove : Icons.add,
                                      color: read
                                          ? Colors.grey
                                          : widget.dataBloc.colorPaletteMap
                                                  .isNotEmpty
                                              ? widget
                                                  .dataBloc
                                                  .colorPaletteMap[
                                                      widget.bookItem.uniqueId]
                                                  .color
                                              : Theme.of(context).accentColor,
                                      size: 30,
                                    ),
                                  ),
                                );
                              }),
                        );
                      }),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ValueListenableBuilder(
                        valueListenable: widget.bookItem.read,
                        builder: (BuildContext ctx, bool read, Widget wdg) {
                          return FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            color: widget.dataBloc.colorPaletteMap.isNotEmpty
                                ? widget
                                    .dataBloc
                                    .colorPaletteMap[widget.bookItem.uniqueId]
                                    .color
                                : Theme.of(context).accentColor,
                            onPressed: () {
                              if (read) {
                                widget.dataBloc.removeReadBook(widget.bookItem);
                                createToast(
                                    context,
                                    "Removed \"" +
                                        widget.bookItem.title +
                                        "\" from your read list");
                              } else {
                                widget.dataBloc
                                    .removeBucketBook(widget.bookItem);
                                widget.dataBloc.addReadBook(widget.bookItem);
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
                              style: getH5().copyWith(color: detailTextColor),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCover(double height) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.15),
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: (height / 2.7),
            width: (height / 2.7) * 0.75,
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
    );
  }
}
