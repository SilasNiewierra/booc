import 'package:flutter/material.dart';

import '../data_bloc.dart';

class Login extends StatefulWidget {
  final DataBloc dataBloc;

  Login({@required this.dataBloc});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Please login"),
            ),
            RaisedButton(
                child: Text("Sign In"),
                onPressed: () {
                  print("logged in");
                  widget.dataBloc.updateSignedInState(true);
                })
          ],
        ),
      ),
    );
  }
}
