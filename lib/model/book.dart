class Book {
  String uniqueId;
  String imgUrl;
  String title;
  String author;
  String category;
  int ranking;

  Book(
      {this.uniqueId,
      this.imgUrl,
      this.title,
      this.author,
      this.category,
      this.ranking});

  updateRanking(int rankingUpdate) {
    this.ranking = rankingUpdate;
  }
}

List<Book> bookListDummy = [
  Book(
      uniqueId: 'e0',
      imgUrl: 'book-burnt.jpeg',
      title: 'Burnt Sugar',
      author: 'Avni Doshi',
      category: 'Novel',
      ranking: 4),
  Book(
      uniqueId: 'e1',
      imgUrl: 'book-chanel.jpeg',
      title: 'Chanel',
      author: 'Thomas Hudson',
      category: 'Biography',
      ranking: 1),
  Book(
      uniqueId: 'e2',
      imgUrl: 'book-halsey.jpeg',
      title: 'I Would leave my body if I could',
      author: 'Halsey',
      category: 'Biography',
      ranking: 3),
  Book(
      uniqueId: 'e3',
      imgUrl: 'book-milk.jpeg',
      title: 'Milk and honey',
      author: 'Rupi Kaur',
      category: 'Novel',
      ranking: 5),
  Book(
      uniqueId: 'e4',
      imgUrl: 'book-shadow.jpeg',
      title: 'The shadow king',
      author: 'Maaza Mengiste',
      category: 'Novel',
      ranking: 2),
  Book(
      uniqueId: 'e5',
      imgUrl: 'book-0.jpeg',
      title: 'Die Sonnenschwester',
      author: 'Lucinda Riley',
      category: 'Novel',
      ranking: 1),
  Book(
      uniqueId: 'e6',
      imgUrl: 'book-1.jpeg',
      title: 'Auf silberner Fährte',
      author: 'Cornelia Funke',
      category: 'Fantasy',
      ranking: 4),
  Book(
      uniqueId: 'e7',
      imgUrl: 'book-2.jpeg',
      title: 'Der Ickaborg',
      author: 'J. K. Rowling',
      category: 'Fantasy',
      ranking: 2),
  Book(
      uniqueId: 'e8',
      imgUrl: 'book-3.jpeg',
      title: 'A promised land',
      author: 'Barack Obama',
      category: 'Biography',
      ranking: 3),
];
