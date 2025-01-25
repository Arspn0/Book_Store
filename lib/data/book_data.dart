import '../models/book.dart';

final List<Map<String, String>> categories = [
  {'id': 'all', 'title': 'All', 'icon': '📚'},
  {'id': 'new', 'title': 'New', 'icon': 'assets/img/Book Cover New.png'},
  {'id': 'kids', 'title': 'Kids', 'icon': '👶'},
  {'id': 'romance', 'title': 'Romance', 'icon': '❤️'},
  {'id': 'horror', 'title': 'Horror', 'icon': '👻'},
  {'id': 'fantasy', 'title': 'Fantasy', 'icon': '🌟'},
  {'id': 'fiction', 'title': 'Fiction', 'icon': '📖'},
];

final List<Book> popularBooks = [
  Book(
    id: '1',
    title: 'Harry Potter 1',
    author: 'J.K Rowling',
    price: 50000,
    isLiked: false,
    imageUrl: 'assets/img/Hp1.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '2',
    title: 'Harry Potter 2',
    author: 'J.K Rowling',
    price: 75000,
    isLiked: false,
    imageUrl: 'assets/img/Hp2.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '3',
    title: 'Narnia',
    author: 'C.S Lewis',
    price: 65000,
    isLiked: false,
    imageUrl: 'assets/img/Narnia.png', // Correct path
    category: 'fantasy',
  ),
];

final List<Book> trendingBooks = [
  Book(
    id: '4',
    title: 'Komet Minor',
    author: 'Tere Liye',
    price: 45000,
    isLiked: false,
    imageUrl: 'assets/img/Komet-Minor.png', // Correct path
    category: 'fiction',
  ),
  Book(
    id: '5',
    title: 'Laskar Pelangi',
    author: 'Andrea Hirata',
    price: 55000,
    isLiked: false,
    imageUrl: 'assets/img/Komet-Minor.png', // Correct path
    category: 'fiction',
  ),
  Book(
    id: '6',
    title: 'Pulang Pergi',
    author: 'Tere Liye',
    price: 70000,
    isLiked: false,
    imageUrl: 'assets/img/PP.png', // Correct path
    category: 'fiction',
  ),
];
