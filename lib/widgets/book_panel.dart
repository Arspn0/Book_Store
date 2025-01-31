import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../data/colors.dart';
import '../provider/wishlist_provider.dart';
import '../provider/favorite_provider.dart';
import '../provider/cart_provider.dart';

class BookPanel extends StatefulWidget {
  final Book book;
  final Function(Book)? onWishlistChanged;
  final Function(Book)? onAddToCart;

  const BookPanel({
    Key? key,
    required this.book,
    this.onWishlistChanged,
    this.onAddToCart,
  }) : super(key: key);

  @override
  State<BookPanel> createState() => _BookPanelState();
}

class _BookPanelState extends State<BookPanel> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistProvider>(
      builder: (context, wishlistProvider, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Image
              Center(
                child: ClipRRect(
                  child: Image.asset(
                    widget.book.imageUrl,
                    height: 200,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Book Title
              Text(
                widget.book.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Book Author
              Text(
                widget.book.author,
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              // Book Price
              Text(
                'Rp${widget.book.price.toStringAsFixed(0)}',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Book Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.book.description ?? 'No description available.',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              // Reviews Section
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'No reviews yet.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  // Wishlist Button (Save Icon)
                  IconButton(
                    icon: Icon(
                      widget.book.isInWhistlist
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                      color: widget.book.isInWhistlist
                          ? AppColors.primary
                          : AppColors.textLight,
                      size: 28,
                    ),
                    onPressed: () {
                      wishlistProvider.toggleWishlist(widget.book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            widget.book.isInWhistlist
                                ? 'Added to Wishlist!'
                                : 'Removed from Wishlist!',
                          ),
                        ),
                      );
                    },
                  ),
                  // In BookPanel class, update the heart icon button:
                  IconButton(
                    icon: Icon(
                      widget.book.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: widget.book.isLiked ? Colors.red : AppColors.textLight,
                      size: 28,
                    ),
                    onPressed: () {
                      final favoritesProvider = context.read<FavoritesProvider>();
                      favoritesProvider.toggleFavorite(widget.book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            widget.book.isLiked
                                ? 'Added to Favorites!'
                                : 'Removed from Favorites!',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  // Add to Cart Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final cartProvider = context.read<CartProvider>();
                        cartProvider.addToCart(widget.book);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to Cart!'),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
