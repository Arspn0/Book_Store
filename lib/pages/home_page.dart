import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/book.dart';
import '../data/book_data.dart'; // Import the book_data.dart file
import '../data/colors.dart';
import '../widgets/book_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _selectedCategory = 'All';

  // Bottom navigation bar items
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Whistlist'),
    Text('Favorites'),
    Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Filter books by category
  List<Book> _filterBooksByCategory(String category) {
    if (category == 'All') {
      return allBooks; // Use the allBooks list here
    }
    return allBooks.where((book) => book.category == category.toLowerCase()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Hi, User!',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Iconsax.shopping_cart),
              onPressed: () {
                // Navigate to cart
              },
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/img/user.png'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search books...',
                  prefixIcon: const Icon(Iconsax.search_normal),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Filter Chips
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = filter['title'];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            filter['icon'],
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            filter['title'],
                            style: TextStyle(
                              color: _selectedCategory == filter['title']
                                  ? AppColors.primary
                                  : AppColors.textLight,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Recommended Section
            _buildSection('Recommended', recomendedBooks),
            // Popular Section
            _buildSection('Popular', popularBooks),
            // Trending Section
            _buildSection('Trending', trendingBooks),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: 'Whistlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.save_2),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.profile_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textLight,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Book> books) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Navigate to view all
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return BookCard(book: book);
              },
            ),
          ),
        ],
      ),
    );
  }
}