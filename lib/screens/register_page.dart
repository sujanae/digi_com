import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.yellow.shade200,
          title: Center(
            child: Text(
              message,
              style: TextStyle(
                  color: Colors.red.shade800, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E1C4), // Pokémon Yellow Theme
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(30),
                // Pokémon Image/Icon
                Image.asset(
                  'assets/pikachu.jpg', // Replace with your Pokémon-themed image
                  height: 100,
                ),
                Gap(20),
                Text(
                  'Become a Pokémon Trainer!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800,
                  ),
                ),
                Gap(20),
                // Email Field
                _customTextField(
                  controller: emailController,
                  hintText: 'Enter your Trainer ID (Email)',
                  obscureText: false,
                ),
                Gap(20),
                // Password Field
                _customTextField(
                  controller: passwordController,
                  hintText: "Enter your Secret Password",
                  obscureText: true,
                ),
                Gap(20),
                // Confirm Password Field
                _customTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm your Secret Password",
                  obscureText: true,
                ),
                Gap(30),
                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    // Add your logic here for button action
                    showErrorMessage(
                        "Pokémon Trainer registration coming soon!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Catch 'em All!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Gap(20),
                // Navigate to Login
                TextButton(
                  onPressed: widget.onTap,
                  child: Text(
                    "Already a Trainer? Go to Login",
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom TextField
  Widget _customTextField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
