import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_project/screens/profile.dart';
import 'package:test_project/screens/wishlist.dart';

import 'course.dart';
import 'home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.scaleTransition,
      splash: Stack(
        children: [
          Image.asset(
            'assets/images/Logo.png',
            fit: BoxFit.cover,
            height: 900,
            width: 600,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      nextScreen: NavbarPage(),
      splashIconSize: 250,
      duration: 2000,
    );
  }
}

class NavbarPage extends StatefulWidget {
  NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    IntroPage(),
    CoursePage(),
    WishListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            showUnselectedLabels: true,
            iconSize: 28,
            selectedItemColor: Colors.amber,
            selectedFontSize: 14,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.book), label: "Courses"),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidHeart), label: "Wishlist"),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.solidUser), label: "Account"),
            ],
          ),
        ),
      ),
    );
  }
}
