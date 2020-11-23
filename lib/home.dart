import 'package:boek/data_bloc.dart';
import 'package:boek/nav_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final DataBloc dataBloc;

  Home({@required this.dataBloc});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(
        dataBloc: widget.dataBloc,
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              children: [],
            ),
            Row(),
            _buildRecentBooks(),
            _buildExploreBooks(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentBooks() {
    return Container();
  }

  Widget _buildExploreBooks() {
    return Container();
  }
}
