
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/LoginPage.dart';

import '../shared/constant/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var searchTfController = TextEditingController();
  var username = FirebaseAuth.instance.currentUser!.displayName;
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello,$username"),
          Text("Make your own food,\n stay at home"),
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: searchTfController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search any recipe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:  BorderSide(color: Colors.red,width: 12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: textFieldColor),
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                signOut();
              },
              child: Text("Sign out")
          ),
        ],
      )
    );
  }
}
