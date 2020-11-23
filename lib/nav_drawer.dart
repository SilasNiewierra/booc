import 'package:flutter/material.dart';

import 'data_bloc.dart';

class NavDrawer extends StatelessWidget {
  final DataBloc dataBloc;

  NavDrawer({this.dataBloc});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Analyze'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              Navigator.of(context).pop(),
              dataBloc.updateSignedInState(false)
            },
          ),
        ],
      ),
    );
  }
}
