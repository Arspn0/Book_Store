import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../data/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              'Profile',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Iconsax.setting_2),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.accent),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Settings Container
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Iconsax.shopping_bag,
                    title: 'Purchase History',
                    onTap: () {
                      // Navigate to Purchase History
                    },
                  ),
                  const Divider(height: 1, indent: 56),
                  _buildMenuItem(
                    icon: Iconsax.user,
                    title: 'Profile Settings',
                    onTap: () {
                      // Navigate to Profile Settings
                    },
                  ),
                  const Divider(height: 1, indent: 56),
                  _buildMenuItem(
                    icon: Iconsax.security_user,
                    title: 'Legal & Privacy',
                    onTap: () {
                      // Navigate to Legal & Privacy
                    },
                  ),
                  const Divider(height: 1, indent: 56),
                  _buildMenuItem(
                    icon: Iconsax.information,
                    title: 'Help',
                    onTap: () {
                      // Navigate to Help
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      content: const Text(
                        'Are you sure you want to logout?',
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const LoginPage()),
                            // );
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: "Poppins", color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Icon(
                icon,
                color: AppColors.secondary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Iconsax.arrow_right_34,
              color: AppColors.textLight,
            ),
          ],
        ),
      ),
    );
  }
}
