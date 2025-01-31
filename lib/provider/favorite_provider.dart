import 'package:flutter/foundation.dart';
import '../models/book.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Book> _favoriteBooks = [];

  List<Book> get favoriteBooks => _favoriteBooks;

  void toggleFavorite(Book book) {
    book.toggleLike();
    if (book.isLiked) {
      if (!_favoriteBooks.contains(book)) {
        _favoriteBooks.add(book);
      }
    } else {
      _favoriteBooks.remove(book);
    }
    notifyListeners();
  }

  bool isFavorite(Book book) {
    return _favoriteBooks.contains(book);
  }
}