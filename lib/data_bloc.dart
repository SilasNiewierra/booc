import 'package:flutter/material.dart';

class DataBloc {
  ValueNotifier<bool> signedIn = ValueNotifier<bool>(false);

  void updateSignedInState(bool state) {
    this.signedIn.value = state;
  }
}
