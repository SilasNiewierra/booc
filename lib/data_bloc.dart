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

  ValueNotifier<List<Book>> readBookItems = ValueNotifier<List<Book>>([]);
  ValueNotifier<List<Book>> bucketBookItems = ValueNotifier<List<Book>>([]);
  ValueNotifier<List<Book>> exploreBookItems = ValueNotifier<List<Book>>([]);

  ValueNotifier<List<charts.Series<ChartSegment, String>>> categoryData =
      ValueNotifier<List<charts.Series<ChartSegment, String>>>(null);

  Map<String, PaletteColor> colorPaletteMap;

  List<Book> bookListDummy = [
    Book(
        uniqueId: 'b0',
        imgUrl: 'book-burnt.jpeg',
        title: 'Burnt Sugar',
        author: 'Avni Doshi',
        category: 'Novel',
        description:
            "In her youth, Tara was wild. She abandoned her arranged marriage to join an ashram, took a hapless artist for a lover, rebelled against every social expectation of a good Indian woman - all with her young child in tow. Years on, she is an old woman with a fading memory, mixing up her maid's wages and leaving the gas on all night, and her grown-up daughter is faced with the task of caring for a mother who never seemed to care for her."),
    Book(
        uniqueId: 'b1',
        imgUrl: 'book-chanel.jpeg',
        title: 'Chanel: Collections and Creations',
        author: 'Daniele Bott',
        category: 'Collection',
        description:
            "Chanel's combination of tradition, originality and style has always made it the most seductive of brands. Here the House of Chanel opens its private archives, revealing a galaxy of brilliant designs created by Coco Chanel from the 1920s onwards, and now reinterpreted to become the motifs for brand new garments, accessories and beauty products."),
    Book(
        uniqueId: 'b2',
        imgUrl: 'book-halsey.jpeg',
        title: 'I Would leave my body if I could',
        author: 'Halsey',
        category: 'Biography',
        description:
            "In this debut collection, Halsey bares her soul. Bringing the same artistry found in her lyrics, Halsey’s poems delve into the highs and lows of doomed relationships, family ties, sexuality, and mental illness. More hand grenades than confessions, these autobiographical poems explore and dismantle conventional notions of what it means to be a feminist in search of power."),
    Book(
        uniqueId: 'b3',
        imgUrl: 'book-milk.jpeg',
        title: 'Milk and honey',
        author: 'Rupi Kaur',
        category: 'Collection',
        description:
            "The book is divided into four chapters, and each chapter serves a different purpose. Deals with a different pain. Heals a different heartache. Milk and Honey takes readers through a journey of the most bitter moments in life and finds sweetness in them because there is sweetness everywhere if you are just willing to look."),
    Book(
        uniqueId: 'b4',
        imgUrl: 'book-shadow.jpeg',
        title: 'The shadow king',
        author: 'Maaza Mengiste',
        category: 'Novel',
        description:
            "With the threat of Mussolini's army looming, recently orphaned Hirut struggles to adapt to her new life as a maid. Her new employer, Kidane, an officer in Emperor Haile Selassie's army, rushes to mobilise his strongest men before the Italians invade.Hirut and the other women long to do more than care for the wounded and bury the dead. When Emperor Haile Selassie goes into exile and Ethiopia quickly loses hope, it is Hirut who offers a plan to maintain morale. She helps disguise a gentle peasant as the emperor and soon becomes his guard, inspiring other women to take up arms. But how could she have predicted her own personal war, still to come, as a prisoner of one of Italy's most vicious officers?"),
    Book(
        uniqueId: 'b5',
        imgUrl: 'book-invisible.jpeg',
        title: 'The Invisible Life of Addie LaRue',
        author: 'V. E. Schwab',
        category: 'Novel',
        description:
            "A Life No One Will Remember. A Story You Will Never Forget.France, 1714: in a moment of desperation, a young woman makes a Faustian bargain to live forever--and is cursed to be forgotten by everyone she meets.Thus begins the extraordinary life of Addie LaRue, and a dazzling adventure that will play out across centuries and continents, across history and art, as a young woman learns how far she will go to leave her mark on the world. But everything changes when, after nearly 300 years, Addie stumbles across a young man in a hidden bookstore and he remembers her name."),
    Book(
        uniqueId: 'b6',
        imgUrl: 'book-1.jpeg',
        title: 'Auf silberner Fährte',
        author: 'Cornelia Funke',
        category: 'Fantasy',
        description:
            "With her sequel to the Reckless series, Fuchs and Jacob must endure stirring adventures on their journey through Japan and fight for their love.The fourth adventure behind the mirrors takes Jacob and Fuchs to the Far East. Jacob, together with his brother Will, is looking for a mirror, of which Sixteen, the girl made of glass and silver, has told them about. Will is looking for revenge, Jacob is looking for security for himself and Fox, because the deal he once made with players has not yet been forgotten. But a dead man has other plans, and the mirror they are looking for gives birth to a terrible huntress."),
    Book(
        uniqueId: 'b7',
        imgUrl: 'book-2.jpeg',
        title: 'Der Ickaborg',
        author: 'J. K. Rowling',
        category: 'Fantasy',
        description:
            "The Ickabog is coming... A mythical monster, a kingdom in peril, an adventure that will test two children's bravery to the limit. Discover a brilliantly original fairy tale about the power of hope and friendship to triumph against all odds, from one of the world's best storytellers."),
    Book(
        uniqueId: 'b8',
        imgUrl: 'book-3.jpeg',
        title: 'A promised land',
        author: 'Barack Obama',
        category: 'Biography',
        description:
            "Obama takes readers on a compelling journey from his earliest political aspirations to the pivotal Iowa caucus victory that demonstrated the power of grassroots activism to the watershed night of November 4, 2008, when he was elected 44th president of the United States, becoming the first African American to hold the nation’s highest office."),
    Book(
        uniqueId: 'b9',
        imgUrl: 'book-dune.jpeg',
        title: 'Dune',
        author: 'Frank Herbert',
        category: 'Novel',
        description:
            "Melange, or 'spice', is the most valuable - and rarest - element in the universe. And it can only be found on a single planet: the inhospitable desert world Arrakis.Whoever controls Arrakis controls the spice. And whoever controls the spice controls the universe.When stewardship of Arrakis is transferred to his house, Paul Atreides must travel to the planet's dangerous surface to ensure the future of his family and his people. But as malevolent forces explode into conflict around him, Paul is thrust into a great destiny beyond his understanding."),
    Book(
        uniqueId: 'b10',
        imgUrl: 'book-stars.jpeg',
        title: 'To Sleep in a Sea of Stars',
        author: 'Christopher Paolini',
        category: 'Fantasy',
        description:
            "During a routine survey mission on an uncolonized planet, Kira finds an alien relic. At first she's delighted, but elation turns to terror when the ancient dust around her begins to move.As war erupts among the stars, Kira is launched into a galaxy-spanning odyssey of discovery and transformation. First contact isn't at all what she imagined, and events push her to the very limits of what it means to be human.While Kira faces her own horrors, Earth and its colonies stand upon the brink of annihilation. Now, Kira might be humanity's greatest and final hope . . ."),
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
    book.read.value = true;

    readBooksList.add(book);
    readBookItems.value = readBooksList;
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
    book.read.value = false;
    readBooksList.remove(book);
    readBookItems.value = readBooksList;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    readBookItems.notifyListeners();

    // Analytics
    _createAnalyticsData();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    categoryData.notifyListeners();
  }

  void addBucketBook(Book book) {
    book.bucketed.value = true;

    bucketBooksList.add(book);
    bucketBookItems.value = bucketBooksList;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    bucketBookItems.notifyListeners();
  }

  void removeBucketBook(Book book) {
    book.bucketed.value = false;

    bucketBooksList.remove(book);
    bucketBookItems.value = bucketBooksList;
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
        break;
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
        break;
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
