import 'package:flutter/foundation.dart';

class Book {
  String uniqueId;
  String imgUrl;
  String title;
  String author;
  String category;
  ValueNotifier<bool> like = new ValueNotifier<bool>(false);
  ValueNotifier<bool> read = new ValueNotifier<bool>(false);
  ValueNotifier<bool> bucketed = new ValueNotifier<bool>(false);
  Book({this.uniqueId, this.imgUrl, this.title, this.author, this.category});

  updateLiked(bool like) {
    this.like.value = like;
  }

  updateRead(bool readUpdate) {
    this.read.value = readUpdate;
  }

  updateBucketed(bool bucketUpdate) {
    this.bucketed.value = bucketUpdate;
  }
}
