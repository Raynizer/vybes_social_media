import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Explore Tab Content',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
