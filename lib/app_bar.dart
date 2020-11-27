import 'package:booc/_variables.dart';
import 'package:booc/book_grid_view.dart';
import 'package:booc/data_bloc.dart';
import 'package:booc/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildAppBar(BuildContext context, DataBloc dataBloc, String title,
    PageContext heroTag) {
  ValueNotifier<bool> searchClicked = ValueNotifier<bool>(false);

  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: heroTag == PageContext.home
              ? GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuScreen(dataBloc: dataBloc)),
                  ),
                  child: Icon(
                    Icons.menu,
                    color: defaultTextColor,
                    size: 30.0,
                  ),
                )
              : SvgPicture.asset(
                  'assets/icons/back.svg',
                  color: defaultTextColor,
                ),
          onPressed: () => Navigator.pop(context),
        ),
        // Hero(
        //   tag: heroTag,
        //   child: Text(
        //     title,
        //     style: Theme.of(context)
        //         .textTheme
        //         .headline5
        //         .copyWith(color: defaultTextColor),
        //   ),
        // ),
        ValueListenableBuilder(
          valueListenable: searchClicked,
          builder: (BuildContext ctx, bool searchClicked, Widget wdg) {
            return searchClicked
                ? Container(
                    width: 300,
                    child: TextField(
                      onChanged: (value) {
                        filterSearchResults(value, dataBloc, heroTag);
                      },
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(decoration: TextDecoration.none),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: defaultTextColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).accentColor),
                        ),
                        hintText: "Search by title or author",
                      ),
                    ),
                  )
                : Container();
          },
        ),
        heroTag == PageContext.analytics
            ? IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.transparent,
                  size: 30.0,
                ),
                onPressed: null,
              )
            : ValueListenableBuilder(
                valueListenable: searchClicked,
                builder: (BuildContext ctx, bool searching, Widget wdg) {
                  return searching
                      ? IconButton(
                          icon: Icon(
                            Icons.close,
                            color: defaultTextColor,
                            size: 30.0,
                          ),
                          onPressed: () {
                            searchClicked.value = false;
                            dataBloc.resetBookItems(heroTag);
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.search,
                            color: defaultTextColor,
                            size: 30.0,
                          ),
                          onPressed: () {
                            searchClicked.value = true;
                          },
                        );
                }),
      ],
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
