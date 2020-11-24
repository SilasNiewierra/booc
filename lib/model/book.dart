import 'package:flutter/foundation.dart';

class Book {
  String uniqueId;
  String imgUrl;
  String title;
  String author;
  String category;
  ValueNotifier<bool> like = new ValueNotifier<bool>(false);
  ValueNotifier<bool> read = new ValueNotifier<bool>(false);
  Book({this.uniqueId, this.imgUrl, this.title, this.author, this.category});

  updateRating(bool like) {
    this.like.value = like;
  }

  updateRead(bool readUpdate) {
    this.read.value = readUpdate;
  }
}

List<Book> bookListDummy = [
  Book(
      uniqueId: 'e0',
      imgUrl: 'book-burnt.jpeg',
      title: 'Burnt Sugar',
      author: 'Avni Doshi',
      category: 'Novel'),
  Book(
      uniqueId: 'e1',
      imgUrl: 'book-chanel.jpeg',
      title: 'Chanel',
      author: 'Thomas Hudson',
      category: 'Biography'),
  Book(
      uniqueId: 'e2',
      imgUrl: 'book-halsey.jpeg',
      title: 'I Would leave my body if I could',
      author: 'Halsey',
      category: 'Biography'),
  Book(
      uniqueId: 'e3',
      imgUrl: 'book-milk.jpeg',
      title: 'Milk and honey',
      author: 'Rupi Kaur',
      category: 'Novel'),
  Book(
      uniqueId: 'e4',
      imgUrl: 'book-shadow.jpeg',
      title: 'The shadow king',
      author: 'Maaza Mengiste',
      category: 'Novel'),
  Book(
      uniqueId: 'e5',
      imgUrl: 'book-0.jpeg',
      title: 'Die Sonnenschwester',
      author: 'Lucinda Riley',
      category: 'Novel'),
  Book(
      uniqueId: 'e6',
      imgUrl: 'book-1.jpeg',
      title: 'Auf silberner Fährte',
      author: 'Cornelia Funke',
      category: 'Fantasy'),
  Book(
      uniqueId: 'e7',
      imgUrl: 'book-2.jpeg',
      title: 'Der Ickaborg',
      author: 'J. K. Rowling',
      category: 'Fantasy'),
  Book(
      uniqueId: 'e8',
      imgUrl: 'book-3.jpeg',
      title: 'A promised land',
      author: 'Barack Obama',
      category: 'Biography'),
];

String descriptionDummy =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
