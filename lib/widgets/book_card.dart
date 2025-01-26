import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/book.dart';
import '../data/colors.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.asset(
                  book.imageUrl,
                  height: 120,
                  width: 90,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    book.isLiked ? Iconsax.heart5 : Iconsax.heart,
                    color: book.isLiked ? Colors.red : Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Book Title
          Text(
            book.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          // Book Price
          Text(
            'Rp${book.price.toStringAsFixed(0)}',
            style: TextStyle(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // Book Rating
          Row(
            children: [
              const Icon(Iconsax.star1, size: 16, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                '4.5', // Replace with actual rating if available
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}