import 'package:flutter/material.dart';

class BooksOverview extends StatefulWidget {
  @override
  _BooksOverviewState createState() => _BooksOverviewState();
}

class _BooksOverviewState extends State<BooksOverview> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(
        8,
        (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        },
      ),
    );
  }
}
