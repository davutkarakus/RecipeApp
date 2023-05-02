
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/FavoriPage.dart';
import 'package:flutter_recipe_app/pages/HomePage.dart';
import 'package:flutter_recipe_app/pages/ProfilePage.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favorites"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile"
          ),
        ],
        backgroundColor: Colors.orangeAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
