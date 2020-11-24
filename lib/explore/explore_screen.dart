import 'package:boek/detail/detail_screen.dart';
import 'package:boek/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      title: Text("Add New Read Books"),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.blueGrey[900],
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [],
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildExploreBooks() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (250 / 350),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: List.generate(
        allBooks.length,
        (index) => _buildCoverBookItem(allBooks[index]),
      ),
    );
  }

  Widget _buildCoverBookItem(Book bookItem) {
    return Center(
      child: Container(
        height: 350,
        width: 250,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                      dataBloc: widget.dataBloc, bookItem: bookItem)),
            );
          },
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.teal,
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
        ),
      ),
    );
  }
}
