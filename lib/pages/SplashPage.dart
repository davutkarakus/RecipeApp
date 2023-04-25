import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/OnboardingPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/backGround.png"),
            fit: BoxFit.cover
          ),
        ),
        child: Opacity(opacity:0.7,child: ClipRRect(borderRadius:BorderRadius.circular(135),child: SizedBox(height:270,width:270,child: Image.asset("images/iconApp.png",)))),
      ),
    );
  }
}
