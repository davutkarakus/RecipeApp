
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/LoginPage.dart';
import 'package:flutter_recipe_app/shared/custom-widgets/CustomShowDialog.dart';
import 'package:flutter_recipe_app/shared/custom-widgets/customTextField.dart';

import '../shared/constant/colors.dart';


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
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  Future<void> signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try {
     final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text.trim(), password: passwordTextController.text.trim());
     userCredential.user?.updateDisplayName(usernameTextController.text);
     Navigator.pop(context);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
     await  FirebaseAuth.instance.signOut();
    }on FirebaseAuthException catch(e) {
      Navigator.pop(context);
      CustomShowDialog(e.message.toString(), "Error", context);
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
              CustomTextField(labelText: "Username", validateText: "Please enter your username", tfController: usernameTextController,prefixIcon: Icons.person,hasSuffixIcon: false,passwordVisible: true,keyboardType: TextInputType.name,),
              CustomTextField(labelText: "Email", validateText: "Please enter your e-mail address", tfController: emailTextController,prefixIcon: Icons.email_outlined,hasSuffixIcon: false,passwordVisible: true,keyboardType: TextInputType.emailAddress,),
              CustomTextField(labelText: "Password", validateText: "Please enter your password", tfController: passwordTextController, prefixIcon: Icons.lock_outlined,passwordVisible: passwordVisible,hasSuffixIcon: true,keyboardType: TextInputType.visiblePassword,),
              CustomTextField(labelText: "Confirm Password", validateText: "Please confirm your password", tfController: confirmPwTextController, prefixIcon: Icons.lock_outlined, passwordVisible: confirmPasswordVisible, hasSuffixIcon: true,keyboardType: TextInputType.visiblePassword,),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,top: 50),
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
                            if(passwordTextController.text != confirmPwTextController.text) {
                              CustomShowDialog("Password does not match", "Error", context);
                            }else {
                              signUp();
                            }
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
