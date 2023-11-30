import 'package:flutter/material.dart';
import 'package:vybes/sign_in.dart';
import 'package:vybes/sign_up.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  int _pageCount = 3; // Set the number of pages here

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3E64FF), // Uniform background color
        elevation: 0, // Remove the app bar shadow
      ),
      body: Stack(
        children: [
          _buildBackground(), // Custom colorful background
          _buildCircles(), // Add bluish-grey circles
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 70), // Adjust the space above Vybes name
              Text(
                'Vybes',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  color: Colors.white, // Customize text color
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 150),
              Container(
                height: 200, // Customize the height of the PageView
                child: PageView(
                  controller: _pageController,
                  children: [
                    _buildOnboardingPage(
                      Iconsax.heart_tick,
                      'Discover and Share',
                      'Explore new connections and share your experiences with Vybes.',
                    ),
                    _buildOnboardingPage(
                      Iconsax.people,
                      'Connect with Friends',
                      'Stay connected with your friends and family like never before.',
                    ),
                    _buildOnboardingPage(
                      Iconsax.star,
                      'Your Social Space',
                      'A place for your ideas, photos, and moments.',
                    ),
                    // Add more pages as needed
                  ],
                ),
              ),
              SizedBox(height: 150),
              _buildCircleIndications(_pageCount), // Number of onboarding pages
              SizedBox(height: 40), // Adjust the space below indicators
              ElevatedButton.icon(
                onPressed: () {
                  _showBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                icon: Icon(
                  Icons.arrow_circle_right_outlined, // Arrow icon for "Get Started" button
                  size: 24,
                ),
                label: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3E64FF), Color(0xFF9433D0), Color(0xFFB22222)], // Customize background colors
        ),
      ),
    );
  }

  Widget _buildCircles() {
    return Stack(
      children: [
        // Large bluish-grey circle at the bottom
        Positioned(
          bottom: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x30C0C0C0), // Bluish-grey with reduced opacity
            ),
          ),
        ),
        // Small bluish-grey circles scattered around
        Positioned(
          bottom: 70,
          right: 200,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x30C0C0C0), // Bluish-grey with reduced opacity
            ),
          ),
        ),
        Positioned(
          bottom: 600,
          right: 150,
          left: 0,
          top: 20,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x30C0C0C0), // Bluish-grey with reduced opacity
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 30,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x40C0C0C0), // Bluish-grey with reduced opacity
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: 50,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x40C0C0C0), // Bluish-grey with reduced opacity
            ),
          ),
        ),
        // Add more small circles as needed
      ],
    );
  }

  Widget _buildOnboardingPage(IconData icon, String title, String description) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x80FFFFFF), // Transparent white circle background
          ),
          child: Center(
            child: Icon(
              icon,
              size: 60,
              color: Colors.white, // Customize icon color
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Customize text color
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white, // Customize text color
          ),
        ),
      ],
    );
  }

  Widget _buildCircleIndications(int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) {
          return Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index ? Colors.white : Colors.white38,
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              _buildBottomSheetButton('Sign In', () {
                // Navigate to sign-in screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              }),
              Divider(),
              _buildBottomSheetButton('Sign Up', () {
                // Navigate to sign-up screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              }),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetButton(String label, Function() onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3E64FF), // Customize text color
          ),
        ),
      ),
    );
  }
}
