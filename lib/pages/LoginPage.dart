import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/ForgotPasswordPage.dart';
import 'package:flutter_recipe_app/pages/MainPage.dart';
import 'package:flutter_recipe_app/pages/SignupPage.dart';
import 'package:flutter_recipe_app/shared/custom-widgets/CustomShowDialog.dart';
import 'package:flutter_recipe_app/shared/custom-widgets/customTextField.dart';

import '../shared/constant/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checked = false;
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
  Future<void> logIn() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTextController.text.trim(), password: passwordTextController.text.trim());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      CustomShowDialog(e.message.toString(), "Error", context);
    }
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
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset("images/loginIcon.png",width: 35,height: 35,),
              ),
              Text("Login to your account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
              CustomTextField(labelText: "Email", validateText: "Please enter your e-mail address", tfController: emailTextController,prefixIcon: Icons.email_outlined,hasSuffixIcon: false,passwordVisible: true,keyboardType: TextInputType.emailAddress,),
              CustomTextField(labelText: "Password", validateText: "Please enter your password", tfController: passwordTextController,prefixIcon: Icons.lock_outlined,hasSuffixIcon: true,passwordVisible: passwordVisible,keyboardType: TextInputType.visiblePassword,),
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
                            logIn();
                          }
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
      ),
    );
  }
}
