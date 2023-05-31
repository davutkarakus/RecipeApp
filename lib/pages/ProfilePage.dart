import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> signOut() async{
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }catch(e) {
      print(e);
    }
  }
  var kullanici = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/backGround.png"),
              fit: BoxFit.cover,
              opacity: 1
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    SizedBox(width: 150,height: 150,child: ClipRRect(borderRadius: BorderRadius.circular(75),child: Image(image: AssetImage("images/profile.png")))),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(width: 35,height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber,
                        ),
                      child:  Icon(
                        Icons.edit_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 15,),
                  Text(kullanici!.displayName!,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
                  SizedBox(height: 5,),
                  Text(kullanici!.email!,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 220,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: (){

                    },
                        child: Text("Edit Profile",style: TextStyle(color: Colors.black,fontSize: 16),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,shape: StadiumBorder()),
                    ),
                  ),
                  SizedBox(height: 50,),
                  TextButton(
                      onPressed: (){

                      },
                      child: Text("Change Password",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),)
                  ),
                  TextButton(
                      onPressed: (){
                        showDialog(context: context, builder: (_) => AlertDialog(
                          title: Text("Log Out?"),
                          content: Text("Do you really want to log out?"),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            },child: Text("No",style: TextStyle(fontSize: 17),)),
                            TextButton(onPressed: (){
                              signOut();
                            },child: Text("Yes",style: TextStyle(color: Colors.redAccent,fontSize: 17),),),
                          ],
                          elevation: 24,

                        ));

                  },
                      child: Text("Log Out",style: TextStyle(fontSize: 18,color: Colors.redAccent,fontWeight: FontWeight.w500),)
                  ),
                  TextButton(
                      onPressed: (){

                      },
                      child: Text("Delete Account",style: TextStyle(fontSize: 18,color: Colors.redAccent,fontWeight: FontWeight.w500),)
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

