import 'package:booc/_variables.dart';
import 'package:booc/book_grid_view.dart';
import 'package:booc/data_bloc.dart';
import 'package:booc/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildAppBar(BuildContext context, DataBloc dataBloc, String title,
    PageContext pageContext) {
  ValueNotifier<bool> searchClicked = ValueNotifier<bool>(false);
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        pageContext != PageContext.home
            ? IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/back.svg',
                  color: defaultTextColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  dataBloc.resetBookItems(pageContext);
                },
              )
            : IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  color: defaultTextColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuScreen(dataBloc: dataBloc)),
                  );
                  dataBloc.resetBookItems(pageContext);
                },
              ),
        ValueListenableBuilder(
          valueListenable: searchClicked,
          builder: (BuildContext ctx, bool searchClicked, Widget wdg) {
            return searchClicked
                ? Container(
                    width: 300,
                    child: TextField(
                      onChanged: (value) {
                        filterSearchResults(value, dataBloc, pageContext);
                      },
                      textAlign: TextAlign.center,
                      style: getH6().copyWith(decoration: TextDecoration.none),
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
        pageContext == PageContext.analytics
            ? IconButton(
                icon: SvgPicture.asset('assets/icons/search.svg',
                    color: Colors.transparent),
                onPressed: null,
              )
            : ValueListenableBuilder(
                valueListenable: searchClicked,
                builder: (BuildContext ctx, bool searching, Widget wdg) {
                  return searching
                      ? IconButton(
                          icon: SvgPicture.asset('assets/icons/cancel.svg',
                              color: defaultTextColor),
                          onPressed: () {
                            searchClicked.value = false;
                            dataBloc.resetBookItems(pageContext);
                          },
                        )
                      : IconButton(
                          icon: SvgPicture.asset('assets/icons/search.svg',
                              color: defaultTextColor),
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
