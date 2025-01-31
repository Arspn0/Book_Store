import 'package:flutter/foundation.dart';
import '../models/book.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Book> _wishlistBooks = [];

  List<Book> get wishlistBooks => _wishlistBooks;

  void toggleWishlist(Book book) {
    book.toggleWhistlist();
    if (book.isInWhistlist) {
      if (!_wishlistBooks.contains(book)) {
        _wishlistBooks.add(book);
      }
    } else {
      _wishlistBooks.remove(book);
    }
    notifyListeners();
  }

  bool isInWishlist(Book book) {
    return _wishlistBooks.contains(book);
  }
}