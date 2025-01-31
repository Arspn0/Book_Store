import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';
import '../data/colors.dart';
import '../provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            title: const Text(
              'Shopping Cart',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: cartProvider.itemCount == 0
              ? const Center(
                  child: Text(
                    'Your cart is empty!',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: AppColors.textLight,
                      fontSize: 16,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final book = cartProvider.cartItems.keys.elementAt(index);
                          final quantity = cartProvider.cartItems[book];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  // Book Image
                                  ClipRRect(
                                    child: Image.asset(
                                      book.imageUrl,
                                      height: 85,
                                      width: 60,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Book Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title,
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          book.author,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: AppColors.textLight,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Rp${book.price.toStringAsFixed(0)}',
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: AppColors.text,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Quantity Controls
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Iconsax.minus_cirlce),
                                        onPressed: () => cartProvider.removeFromCart(book),
                                      ),
                                      Text(
                                        quantity.toString(),
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Iconsax.add_circle),
                                        onPressed: () => cartProvider.addToCart(book),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Cart Summary
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  fontFamily: "Poppins",    
                                ),
                              ),
                              Text('Rp${cartProvider.subtotal.toStringAsFixed(0)}', style: TextStyle(fontFamily: "Poppins")),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tax (11%)',
                                style: TextStyle(
                                  fontFamily: "Poppins",    
                                ),
                                ),
                              Text('Rp${cartProvider.tax.toStringAsFixed(0)}', style: TextStyle(fontFamily: "Poppins" )),
                            ],
                          ),
                          const Divider(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontFamily: "Poppins", 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Rp${cartProvider.total.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontFamily: "Poppins", 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Show processing dialog
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Row(
                                      children: const [
                                        CircularProgressIndicator(),
                                        SizedBox(width: 16),
                                        Text(
                                          'Your order is being processed...',
                                          style: TextStyle(
                                            fontFamily: "Poppins", 
                                            fontSize: 12,
                                          ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              );

                              // Simulate processing time
                              Future.delayed(const Duration(seconds: 2), () {
                                // Clear cart
                                cartProvider.clearCart();
                                
                                // Close processing dialog
                                Navigator.of(context).pop();
                                
                                // Show success message and navigate back
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Order completed successfully!',
                                      style: TextStyle(
                                        fontFamily: "Poppins", 
                                        fontSize: 16,
                                      ),
                                      ),
                                  ),
                                );
                                Navigator.of(context).pop();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: const Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}