import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../data/colors.dart';
import '../widgets/bottom_navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == 'user123' && 
          _passwordController.text == 'password123') {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(
            'Invalid username or password',
            style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
            ),
            )),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // App Logo or Title
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: "Poppins",
                          color: AppColors.text,
                          fontSize: 40,
                        ),
                  ),
                  const SizedBox(height: 32),

                  // Username Field
                  TextFormField(
                    style: TextStyle(
                      fontFamily: "Poppins"
                    ),
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Iconsax.user, color: AppColors.primary),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    style: TextStyle(
                      fontFamily: "Poppins"
                    ),
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Iconsax.lock, color: AppColors.primary),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),

                  // Login Button
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}