
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/constant/colors.dart';
import 'package:flutter_recipe_app/pages/ForgotPasswordPage.dart';
import 'package:flutter_recipe_app/pages/SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgContainer.withOpacity(1),
          image: DecorationImage(
              image: AssetImage("images/loginBg.png"),
              fit: BoxFit.cover,
            opacity: 0.3
              ),
        ),
        child: Form(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset("images/loginIcon.png",width: 35,height: 35,),
            ),
            Text("Login to your account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50,top: 17),
              child: Opacity(
                opacity: 0.9,
                child: SizedBox(
                  height: 55,
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
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
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
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
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                    child: Transform.scale(
                      scale: 0.7,
                      child: Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white),
                        child: Checkbox(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white,
                                width: 1
                              )
                            ),
                            focusColor: Colors.white,
                            checkColor: Colors.white,
                            activeColor: textFieldColor,
                            value: _checked,
                            onChanged: (value) {
                            setState(() {
                              _checked = value!;
                            });
                            },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("Remember me",style: TextStyle(color: Colors.white,fontSize: 13.5),),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ForgotPasswordPage(),fullscreenDialog: true));
                      },
                      child: Text("Forgot Password?",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50,top: 33),
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
                        print("Login button tıklandı");
                      },
                      child: Text("LOG IN",style: TextStyle(color: Colors.black,fontSize: 16),)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom:50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?",style: TextStyle(color: Colors.white,fontSize: 14),),
                  TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignupPage()));
                      },
                      child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
