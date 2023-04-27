

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/LoginPage.dart';

import '../constant/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var usernameTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var confirmPwTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);

    }on FirebaseAuthException catch(e) {
      print(e);
    }
  }
  @override
  void dispose() {
    usernameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPwTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: bgContainer.withOpacity(1),
          image: DecorationImage(
              image: AssetImage("images/loginBg.png"),
              fit: BoxFit.cover,
              opacity: 0.3
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset("images/loginIcon.png",width: 35,height: 35,),
              ),
              Text("Create New Account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,top: 17),
                child: Opacity(
                  opacity: 0.9,
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: usernameTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 18,
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: textFieldColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Username",
                        contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,top: 25),
                child: Opacity(
                  opacity: 0.9,
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your e-mail address';
                        }
                        return null;
                      },
                      controller: emailTextController,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                          size: 18,
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: textFieldColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,top: 25),
                child: Opacity(
                  opacity: 0.9,
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: passwordTextController,
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          color: Colors.white,
                          iconSize: 18,
                          onPressed: (() {
                            print("şifre göster gizle");
                          }),
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: textFieldColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,top: 25),
                child: Opacity(
                  opacity: 0.9,
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter confirm your password';
                        }
                        return null;
                      },
                      controller: confirmPwTextController,
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          color: Colors.white,
                          iconSize: 18,
                          onPressed: (() {
                            print("şifre göster gizle");
                          }),
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: textFieldColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,top: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Opacity(
                    opacity: 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(

                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: (){
                          if(_formKey.currentState!.validate()) {
                            signUp();
                          }
                        },
                        child: Text("SIGN UP",style: TextStyle(color: Colors.black,fontSize: 16),)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?",style: TextStyle(color: Colors.white,fontSize: 14),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
