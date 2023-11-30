import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  double progress = 0.0;
  List<String> selectedInterests = [];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 5) {
      currentPage++;
      _pageController.animateToPage(currentPage, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    updateProgress();
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
      _pageController.animateToPage(currentPage, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    updateProgress();
  }

  void updateProgress() {
    setState(() {
      progress = (currentPage + 1) / 6; // 6 is the total number of pages
    });
  }

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildBasicInfoPage(),
            _buildContactInfoPage(),
            _buildPersonalDetailsPage(),
            _buildEducationPage(),
            _buildWorkExperiencePage(),
            _buildInterestsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentPage != 0)
                ElevatedButton(
                  onPressed: previousPage,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Previous',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              Spacer(),
              if (currentPage < 5)
                ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3E64FF)),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(IconData icon, String label, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
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

  Widget _buildPageTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBasicInfoPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPageTitle('Basic Information'),
        SizedBox(height: 20),
        _buildInputField(Icons.person, 'Full Name', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.user, 'Username', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.infoCircle, 'Bio', TextEditingController()),
      ],
    );
  }

  Widget _buildContactInfoPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPageTitle('Contact Information'),
        SizedBox(height: 20),
        _buildInputField(Icons.phone, 'Phone Number', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.facebook, 'Facebook', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.twitter, 'Twitter', TextEditingController()),
      ],
    );
  }

  Widget _buildPersonalDetailsPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPageTitle('Personal Details'),
        SizedBox(height: 20),
        _buildInputField(FontAwesomeIcons.venusMars, 'Gender', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.birthdayCake, 'Date of Birth', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.heart, 'Relationship Status', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.home, 'Hometown', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.city, 'City', TextEditingController()),
      ],
    );
  }

  Widget _buildEducationPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPageTitle('Education'),
        SizedBox(height: 20),
        _buildInputField(FontAwesomeIcons.graduationCap, 'High School', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.university, 'College/University', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.calendar, 'Graduation/Start Year', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.book, 'Major/Field of Study', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.award, 'Academic Achievements', TextEditingController()),
      ],
    );
  }

  Widget _buildWorkExperiencePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPageTitle('Work Experience'),
        SizedBox(height: 20),
        _buildInputField(FontAwesomeIcons.building, 'Company Name', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.briefcase, 'Job Title', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.calendar, 'Employment Period', TextEditingController()),
        SizedBox(height: 10),
        _buildInputField(FontAwesomeIcons.check, 'Job Description/Achievements', TextEditingController()),
      ],
    );
  }

  Widget _buildInterestsPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildPageTitle('Interests'),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildInterestItem('Music', FontAwesomeIcons.music),
              _buildInterestItem('Movies', FontAwesomeIcons.film),
              _buildInterestItem('Books', FontAwesomeIcons.book),
              _buildInterestItem('Sports', FontAwesomeIcons.volleyballBall),
              _buildInterestItem('Travel', FontAwesomeIcons.plane),
              _buildInterestItem('Food', FontAwesomeIcons.utensils),
              _buildInterestItem('Technology', FontAwesomeIcons.laptop),
              // Add more interest items as needed
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInterestItem(String label, IconData icon) {
    bool isSelected = selectedInterests.contains(label);

    return GestureDetector(
      onTap: () {
        toggleInterest(label);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3E64FF) : Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
