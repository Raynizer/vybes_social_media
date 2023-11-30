import 'package:flutter/material.dart';
import 'package:vybes/home_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      body: Container(
        color: Colors.grey[200], // Set the background color to white-grey
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildInputField(Iconsax.user, 'Username or Email'),
                SizedBox(height: 10),
                _buildInputField(Iconsax.lock, 'Password', isPassword: true),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Add functionality for "Forgot Password?"
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF3E64FF), // Text color
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    primary: Color(0xFF3E64FF), // Button color
                  ),
                  child: Text(
                    'Sign In',
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
      ),
    );
  }

  Widget _buildInputField(IconData icon, String label, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
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
}
