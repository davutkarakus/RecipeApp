
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/FavoriPage.dart';
import 'package:flutter_recipe_app/pages/HomePage.dart';
import 'package:flutter_recipe_app/pages/ProfilePage.dart';
import 'package:flutter_recipe_app/shared/constant/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pageList = [HomePage(),FavoriPage(),ProfilePage()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pageList[selectedIndex],
     bottomNavigationBar: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(right: 40,left: 40,bottom: 25),
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              color: textFieldColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child: GNav(
                  backgroundColor: Colors.transparent,
                  rippleColor: Colors.grey.shade800 ,
                  hoverColor: Colors.grey.shade700,
                  haptic: true,
                  tabBorderRadius: 15,
                  tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8)], // tab button shadow
                  curve: Curves.easeOutExpo,
                  gap: 8,
                  color: Colors.grey[800],
                  activeColor: Colors.white,
                  iconSize: 20,
                  tabBackgroundColor: Colors.blueGrey.shade500,
                  padding: EdgeInsets.all(8),
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.favorite_outlined,
                      text: 'Favorites',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ],
                onTabChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
