class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  bool isLiked;
  bool isInWhistlist;
  final String? description;
  final String imageUrl;
  final String category;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.isLiked,
    required this.isInWhistlist,
    this.description,
    required this.imageUrl,
    required this.category,
  });

  void toggleLike() {
    isLiked = !isLiked;
  }

  void toggleWhistlist() {
    isInWhistlist = !isInWhistlist;
  }
}
