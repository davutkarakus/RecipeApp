import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/entity/DetailsPage/RecipeDetailResponse.dart';
import 'package:flutter_recipe_app/shared/constant/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  int recipe_id;
  String recipe_image_url;

  FoodDetailsPage({required this.recipe_id,required this.recipe_image_url});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  RecipeDetailResponse parseInfoResponse(String response) {
    return RecipeDetailResponse.fromJson(json.decode(response));
  }
  Future<RecipeDetailResponse> getInfoRecipe() async {
      var url = "https://api.spoonacular.com/recipes/${widget.recipe_id}/information?apiKey=e466d8bfcfea415a9a663bf33fa8b6f4";
      print(url);
      var cevap = await Dio().get(url);
      print(cevap);
      return parseInfoResponse(cevap.toString());
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
                    image: DecorationImage(
                      image: AssetImage("images/backGround.png"),
                    fit: BoxFit.cover,
                    opacity: 0.7
                ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(32),topLeft: Radius.circular(32)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Yemek Adı"),

                          ],
                        ),
                      ],
                    ),
                  ),

                ),
            ),
          ],
        ),
      ),
    );

  }
}
