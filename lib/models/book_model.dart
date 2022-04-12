class BookModel {
  String? isbn;
  String? title;
  String? cover;
  List<dynamic>? synopsis;
  num? price;

  BookModel({
    required this.isbn,
    required this.title,
    required this.cover,
    required this.synopsis,
    required this.price,
  });

  BookModel copyWith({
    String? isbn,
    String? title,
    String? cover,
    List<dynamic>? synopsis,
    num? price,
  }) =>
      BookModel(
        isbn: isbn ?? this.isbn,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        synopsis: synopsis ?? this.synopsis,
        price: price ?? this.price,
      );

  BookModel.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    title = json['title'];
    cover = json['cover'];
    synopsis = json['synopsis'];
    price = json['price'];
  }
}
