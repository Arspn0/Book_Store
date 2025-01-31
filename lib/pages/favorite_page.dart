// favorites_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/colors.dart';
import '../widgets/book_card.dart';
import '../widgets/book_panel.dart';
import '../provider/favorite_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favoriteBooks = favoritesProvider.favoriteBooks;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            title: const Text(
              'Favorites',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: favoriteBooks.isEmpty
              ? const Center(
                  child: Text(
                    'No favorite books yet!',
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 16,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: favoriteBooks.length,
                    itemBuilder: (context, index) {
                      final book = favoriteBooks[index];
                      return BookCard(
                        book: book,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => BookPanel(
                              book: book,
                              onAddToCart: (book) {
                                // Implement cart functionality
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Added to Cart!'),
                                  ),
                                );
                              },
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