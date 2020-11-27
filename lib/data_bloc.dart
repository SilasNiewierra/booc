import 'package:booc/_variables.dart';
import 'package:flutter/material.dart';
import 'model/book.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:palette_generator/palette_generator.dart';

class DataBloc {
  ValueNotifier<bool> signedIn =
      ValueNotifier<bool>(true); //testing purpose true usually false

  List<Book> readBooksList = [];
  List<Book> bucketBooksList = [];
  List<Book> exploreBooksList = [];

  // ValueNotifier<List<Book>> readBooks = ValueNotifier<List<Book>>([]);
  // ValueNotifier<List<Book>> bucketBooks = ValueNotifier<List<Book>>([]);
  // ValueNotifier<List<Book>> exploreBooks = ValueNotifier<List<Book>>([]);

  ValueNotifier<List<Book>> readBookItems = ValueNotifier<List<Book>>([]);
  ValueNotifier<List<Book>> bucketBookItems = ValueNotifier<List<Book>>([]);
  ValueNotifier<List<Book>> exploreBookItems = ValueNotifier<List<Book>>([]);

  ValueNotifier<List<charts.Series<ChartSegment, String>>> categoryData =
      ValueNotifier<List<charts.Series<ChartSegment, String>>>(null);

  Map<String, PaletteColor> colorPaletteMap;

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

  DataBloc() {
    exploreBooksList = bookListDummy;
    exploreBookItems.value = exploreBooksList;
    // Analytics
    _createAnalyticsData();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    categoryData.notifyListeners();

    // Color Palette for Detail Pages
    colorPaletteMap = {};
    _updatePalletes();
  }

  _updatePalletes() async {
    bookListDummy.forEach((element) async {
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(
              AssetImage('assets/images/' + element.imgUrl),
              size: Size(100, 200));
      colorPaletteMap[element.uniqueId] = generator.darkMutedColor != null
          ? generator.darkMutedColor
          : PaletteColor(Colors.blue, 2);
    });
  }

  void updateSignedInState(bool state) {
    this.signedIn.value = state;
  }

  void addReadBook(Book book) {
    readBooksList.add(book);
    readBookItems.value.add(book);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    readBookItems.notifyListeners();

    // Remove book from bucket list if it has been read
    removeBucketBook(book);

    // Analytics
    _createAnalyticsData();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    categoryData.notifyListeners();
  }

  void removeReadBook(Book book) {
    readBooksList.remove(book);
    readBookItems.value.remove(book);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    readBookItems.notifyListeners();

    // Analytics
    _createAnalyticsData();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    categoryData.notifyListeners();
  }

  void addBucketBook(Book book) {
    bucketBooksList.add(book);
    bucketBookItems.value.add(book);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    bucketBookItems.notifyListeners();
  }

  void removeBucketBook(Book book) {
    bucketBooksList.remove(book);
    bucketBookItems.value.remove(book);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    bucketBookItems.notifyListeners();
  }

  void setBookItems(List<Book> booksToDisplay, PageContext pageContext) {
    switch (pageContext) {
      case PageContext.bucket:
        bucketBookItems.value = booksToDisplay;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        bucketBookItems.notifyListeners();

        break;
      case PageContext.explore:
        exploreBookItems.value = booksToDisplay;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        exploreBookItems.notifyListeners();
        break;
      case PageContext.home:
        readBookItems.value = booksToDisplay;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        readBookItems.notifyListeners();
        break;
      default:
        readBookItems.value = booksToDisplay;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        readBookItems.notifyListeners();
    }
  }

  void resetBookItems(PageContext pageContext) {
    switch (pageContext) {
      case PageContext.bucket:
        bucketBookItems.value = bucketBooksList;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        bucketBookItems.notifyListeners();

        break;
      case PageContext.explore:
        exploreBookItems.value = exploreBooksList;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        exploreBookItems.notifyListeners();
        break;
      case PageContext.home:
        readBookItems.value = readBooksList;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        readBookItems.notifyListeners();
        break;
      default:
        readBookItems.value = readBooksList;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        readBookItems.notifyListeners();
    }
  }

  /// Create one series with sample hard coded data.
  void _createAnalyticsData() {
    var categoryMap = {};
    readBookItems.value.forEach((element) {
      if (!categoryMap.containsKey(element.category)) {
        categoryMap[element.category] = 0;
      }
      categoryMap[element.category]++;
    });

    List<ChartSegment> data = [];
    categoryMap.forEach((k, v) {
      data.add(new ChartSegment(k, v));
    });

    categoryData.value = [
      new charts.Series<ChartSegment, String>(
        id: 'Segments',
        domainFn: (ChartSegment segment, _) => segment.category,
        measureFn: (ChartSegment segment, _) => segment.amount,
        data: data,
        labelAccessorFn: (ChartSegment row, _) =>
            '${row.category}: ${row.amount}',
      )
    ];
  }
}

/// Sample data type.
class ChartSegment {
  final String category;
  final int amount;

  ChartSegment(this.category, this.amount);
}
