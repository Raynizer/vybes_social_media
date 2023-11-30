import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chats Tab Content',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
