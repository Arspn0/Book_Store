import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../widgets/book_card.dart';
import '../widgets/book_panel.dart';
import '../models/book.dart';
import '../data/book_data.dart';
import '../provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Book> wishlistBooks = [];

  void _handleWishlistChanged(Book book) {
    setState(() {
      book.toggleWhistlist(); // Toggle the book's wishlist status
      if (book.isInWhistlist) {
        if (!wishlistBooks.contains(book)) {
          wishlistBooks.add(book);
        }
      } else {
        wishlistBooks.remove(book);
      }
    });
  }

  void initState() {
    super.initState();
    wishlistBooks = allBooks.where((book) => book.isInWhistlist).toList();
  }

  void _handleAddToCart(Book book) {
    // Implement cart functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to Cart!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistProvider>(
      builder: (context, wishlistProvider, child) {
        final wishlistBooks = wishlistProvider.wishlistBooks;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            title: const Text(
              'Wishlist',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: wishlistBooks.isEmpty
              ? const Center(
                  child: Text(
                    'No books in your wishlist yet!',
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: wishlistBooks.length,
                    itemBuilder: (context, index) {
                      final book = wishlistBooks[index];
                      return BookCard(
                        book: book,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => BookPanel(
                              book: book,
                              onWishlistChanged: _handleWishlistChanged,
                              onAddToCart: _handleAddToCart,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
