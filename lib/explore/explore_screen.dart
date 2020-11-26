import 'package:boek/home/components/book_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../data_bloc.dart';
import '../_variables.dart';

class ExploreScreen extends StatefulWidget {
  final DataBloc dataBloc;
  ExploreScreen({@required this.dataBloc});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // final List<Book> allBooks = bookListDummy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: defaultTextColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Find New Books",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: defaultTextColor),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.transparent,
            ),
            onPressed: null,
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: BookGridView(
        dataBloc: widget.dataBloc,
        pageContext: PageContext.explore,
      ),
    );
  }
}
