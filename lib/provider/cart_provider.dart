import 'package:flutter/foundation.dart';
import '../models/book.dart';

class CartProvider extends ChangeNotifier {
  final Map<Book, int> _cartItems = {};
  final double taxRate = 0.11;

  Map<Book, int> get cartItems => _cartItems;

  void addToCart(Book book) {
    if (_cartItems.containsKey(book)) {
      _cartItems[book] = _cartItems[book]! + 1;
    } else {
      _cartItems[book] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Book book) {
    if (_cartItems.containsKey(book)) {
      if (_cartItems[book]! > 1) {
        _cartItems[book] = _cartItems[book]! - 1;
      } else {
        _cartItems.remove(book);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get subtotal {
    double total = 0;
    _cartItems.forEach((book, quantity) {
      total += book.price * quantity;
    });
    return total;
  }

  double get tax => subtotal * taxRate;

  double get total => subtotal + tax;

  int get itemCount {
    int count = 0;
    _cartItems.forEach((book, quantity) {
      count += quantity;
    });
    return count;
  }
}