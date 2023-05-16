import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/shared/constant/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  var recipe_id;
  String recipe_image_url;

  FoodDetailsPage({required this.recipe_id,required this.recipe_image_url});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  Future<void> getInfoRecipe() async {

  }
  @override
  void initState() {
    getInfoRecipe();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: screenSize.height - 500,
                width: screenSize.width,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.recipe_image_url))),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: screenSize.height / 1.5,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade400,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft: Radius.circular(32)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          height: 5,
                          width: 32 * 1.5,
                          decoration: BoxDecoration(
                            gradient: gradient,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),

                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );

  }
}
