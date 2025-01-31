import '../models/book.dart';

final List<Map<String, dynamic>> filters = [
  {'icon': 'assets/img/Books.png', 'title': 'All'},
  {'icon': 'assets/img/BookNew.png', 'title': 'New'},
  {'icon': 'assets/img/BookKids.png', 'title': 'Kids'},
  {'icon': 'assets/img/BookRomance.png', 'title': 'Romance'},
  {'icon': 'assets/img/BookHorror.png', 'title': 'Horror'},
  {'icon': 'assets/img/BookFantasy.png', 'title': 'Fantasy'},
  {'icon': 'assets/img/BookFiction.png', 'title': 'Fiction'},
];

final List<Book> allBooks = [
  Book(
    id: '1',
    title: 'The Lord of The Rings',
    author: 'J.J Tolkien',
    price: 80000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Lotr.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '2',
    title: 'Pulang Pergi',
    author: 'Tere Liye',
    price: 70000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/PP.png', // Correct path
    category: 'fiction',
  ),
  Book(
    id: '3',
    title: 'Narnia',
    author: 'C.S Lewis',
    price: 65000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Narnia.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '4',
    title: 'Komet Minor',
    author: 'Tere Liye',
    price: 45000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Komet-Minor.png', // Correct path
    category: 'fiction',
  ),
];

final List<Book> recomendedBooks = [
  Book(
    id: '1',
    title: 'The Lord of The Rings',
    author: 'J.J Tolkien',
    price: 80000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Lotr.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '2',
    title: 'Pulang Pergi',
    author: 'Tere Liye',
    price: 70000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/PP.png', // Correct path
    category: 'fiction',
  ),
  Book(
    id: '3',
    title: 'Narnia',
    author: 'C.S Lewis',
    price: 65000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Narnia.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '4',
    title: 'Komet Minor',
    author: 'Tere Liye',
    price: 45000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Komet-Minor.png', // Correct path
    category: 'fiction',
  ),
];

final List<Book> popularBooks = [
  Book(
    id: '1',
    title: 'Harry Potter 1',
    author: 'J.K Rowling',
    price: 50000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Hp1.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '2',
    title: 'Harry Potter 2',
    author: 'J.K Rowling',
    price: 75000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Hp2.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '3',
    title: 'Narnia',
    author: 'C.S Lewis',
    price: 65000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Narnia.png', // Correct path
    category: 'fantasy',
  ),
  Book(
    id: '4',
    title: 'The Lord of The Rings',
    author: 'J.J Tolkien',
    price: 80000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Lotr.png', // Correct path
    category: 'fantasy',
  ),
];

final List<Book> trendingBooks = [
  Book(
    id: '1',
    title: 'Komet Minor',
    author: 'Tere Liye',
    price: 45000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Komet-Minor.png', // Correct path
    category: 'fiction',
  ),
  Book(
    id: '2',
    title: 'Laskar Pelangi',
    author: 'Andrea Hirata',
    price: 55000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/Laskar-Pelangi.png', // Correct path
    category: 'fiction',
  ),
  Book(
    id: '3',
    title: 'Pulang Pergi',
    author: 'Tere Liye',
    price: 70000,
    isLiked: false,
    isInWhistlist: false,
    imageUrl: 'assets/img/PP.png', // Correct path
    category: 'fiction',
  ),
];
