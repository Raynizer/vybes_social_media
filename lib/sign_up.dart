import 'package:flutter/material.dart';
import 'package:vybes/profile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create an Account',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildInputField(Iconsax.user, 'Username or Email', _emailController),
              SizedBox(height: 10),
              _buildInputField(Iconsax.lock, 'Password', _passwordController,
                  isPassword: true),
              SizedBox(height: 10),
              _buildInputField(Iconsax.lock, 'Confirm Password',
                  _confirmPasswordController, isPassword: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_validateInputs()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  primary: Color(0xFF3E64FF), // Button color
                ),
                child: Text(
                  'Next',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
      IconData icon, String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: GoogleFonts.poppins(),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color(0xFF3E64FF), // Icon color
          ),
          labelText: label,
          labelStyle: GoogleFonts.poppins(),
          border: InputBorder.none,
        ),
      ),
    );
  }

  bool _validateInputs() {
    // Implement validation logic here
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      // Show an error message or snackbar if any field is empty
      return false;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      // Show an error message or snackbar if passwords don't match
      return false;
    }
    return true;
  }
}
