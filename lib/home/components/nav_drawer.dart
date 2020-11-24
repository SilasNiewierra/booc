import 'package:flutter/material.dart';

import '../../data_bloc.dart';

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Boek',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Max Mustermann',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Analyze'),
            onTap: () => {
              Navigator.of(context).pop(),
            },
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
