import 'package:flutter/material.dart';
import 'model/book.dart';

class DataBloc {
  ValueNotifier<bool> signedIn =
      ValueNotifier<bool>(true); //testing purpose true usually false

  ValueNotifier<List<Book>> readBooks = ValueNotifier<List<Book>>([]);

  void updateSignedInState(bool state) {
    this.signedIn.value = state;
  }

  void addReadBook(Book book) {
    print(readBooks.value);
    print("removing: " + book.toString());
    this.readBooks.value.add(book);
    print(readBooks.value);
    readBooks.notifyListeners();
  }

  void removeReadBook(Book book) {
    print(readBooks.value);
    print("removing: " + book.toString());
    this.readBooks.value.remove(book);
    print(readBooks.value);
    readBooks.notifyListeners();
  }
}
