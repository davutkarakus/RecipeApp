import 'package:flutter/material.dart';

import '../constant/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50,top: 20),
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
                        hintText: "example@gmail.com",
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
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
                          print("Password reset button tıklandı");
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
