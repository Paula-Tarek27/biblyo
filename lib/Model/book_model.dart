class BookModel {
  String? id;
  String? title;
  String? description;
  String? cover;
  String? author;
  String? aboutAuthor;
  String? rating;
  String? category;
  String? language;
  String? bookurl;
  int? price;
  int? pages;

  BookModel({
    this.id,
    this.title,
    this.description,
    this.cover,
    this.author,
    this.aboutAuthor,
    this.rating,
    this.category,
    this.language,
    this.bookurl,
    this.price,
    this.pages,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      cover: json['cover'],
      author: json['author'],
      aboutAuthor: json['aboutAuthor'],
      rating: json['rating'],
      category: json['category'],
      price: json['price'],
      language: json['language'],
      bookurl: json['bookurl'],
      pages: json['pages']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'cover': cover,
      'author': author,
      'aboutAuthor': aboutAuthor,
      'rating': rating,
      'category': category,
      'price': price,
      'language':language,
      'bookurl':bookurl,
      'pages':pages,
    };
  }
}
