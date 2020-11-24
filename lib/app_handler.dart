import 'package:boek/data_bloc.dart';
import 'package:flutter/material.dart';

import './home/home.dart';
import 'login/login.dart';

class AppHandler extends StatefulWidget {
  @override
  _AppHandlerState createState() => _AppHandlerState();
}

class _AppHandlerState extends State<AppHandler> {
  DataBloc _dataBloc;

  @override
  void initState() {
    super.initState();
    _dataBloc = DataBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: _dataBloc.signedIn,
        builder: (BuildContext ctx, bool signedIn, Widget widget) {
          return signedIn
              ? Home(dataBloc: _dataBloc)
              : Login(dataBloc: _dataBloc);
        },
      ),
    );
  }
}
