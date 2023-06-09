import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/LoginPage.dart';
import 'package:flutter_recipe_app/shared/custom-widgets/CustomShowDialog.dart';
import 'package:flutter_recipe_app/shared/custom-widgets/customTextField.dart';

import '../shared/constant/colors.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  var emailTextController = TextEditingController();
  Future<void> resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(),)
    );
    try {
     await FirebaseAuth.instance.sendPasswordResetEmail(email: emailTextController.text.trim());
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
    }on FirebaseAuthException catch(e) {
      Navigator.pop(context);
      CustomShowDialog(e.message.toString(), "Error", context);
    }
  }
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,bottom: 20),
                child: Text("FORGOT PASSWORD",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text("Enter your e-mail address we'll send you a email to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 15,),
                ),
              ),
              Form(
                key: _formKey,
                child: CustomTextField(labelText: "Email", validateText: "Please enter your e-mail address", tfController: emailTextController,prefixIcon: Icons.email_outlined,hasSuffixIcon: false,passwordVisible: true,keyboardType: TextInputType.emailAddress,),
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
                          if(_formKey.currentState!.validate()) {
                            resetPassword();
                          }
                        },
                        child: Text("SUBMIT",style: TextStyle(color: Colors.black,fontSize: 16),)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
