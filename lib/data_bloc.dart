import 'package:flutter/material.dart';

class DataBloc {
  ValueNotifier<bool> signedIn =
      ValueNotifier<bool>(true); //testing purpose true usually false

  void updateSignedInState(bool state) {
    this.signedIn.value = state;
  }
}
