class Book {
  String title;
  DateTime publishDate = DateTime.now();
  String comment;

  Book({
    required this.title,
    required this.comment,
    required this.publishDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          comment == other.comment;

  @override
  int get hashCode => title.hashCode ^ comment.hashCode;

  Book copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
  }) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }
}

main() {
  Book book1 = Book(
      title: "오준석의 플러터 생존 코딩",
      comment: "good",
      publishDate: DateTime.parse('2021-05-28'));

  Book book2 = book1.copyWith();
  Book book3 = book1.copyWith(
      comment: "great", publishDate: DateTime.parse('2022-06-28'));

  Set<Book> set = {book1, book2, book3};

  print(book1 == book2);
  print(book1 == book3);
  print(set.length);

  List<Book> list = [book1, book2, book3];

  list.sort((a, b) => -(a.publishDate.compareTo(b.publishDate)));

  for (var value in list) {
    print(value.publishDate);
  }
}
