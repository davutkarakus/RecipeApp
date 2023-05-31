import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
    String parsedstring1 = response.replaceAll(exp, '');
    return RecipeDetailResponse.fromJson(json.decode(parsedstring1));
  }
  Future<RecipeDetailResponse> getInfoRecipe() async {
      var url = "https://api.spoonacular.com/recipes/${widget.recipe_id}/information?apiKey=97205ed88a404d8d8ef1e63c83d6cd47";
      print(url);
      var cevap = await Dio().get(url);
      return parseInfoResponse(cevap.toString());
  }
  @override
  void initState() {
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
                        Expanded(
                          child: FutureBuilder<RecipeDetailResponse>(
                              future: getInfoRecipe(),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  var infos = snapshot.data;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(child: Text(infos!.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),softWrap: true,textAlign: TextAlign.start,)),
                                          Padding(
                                            padding: const EdgeInsets.only(left:10.0),
                                            child: Container(
                                              width: 70,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: navBarItem,
                                                borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.favorite_outlined,color: Colors.white,size: 18,),
                                                  SizedBox(width: 5,),
                                                  Text("${infos.aggregateLikes}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.justify,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 120,
                                              height: 27,
                                              decoration: BoxDecoration(
                                                color: navBarItem,
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.access_time_outlined,size: 17,color: Colors.white,),
                                                  SizedBox(width: 5,),
                                                  Text("Total Time ${infos.readyInMinutes}m",style: TextStyle(color: Colors.white,fontSize: 12),)
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              height: 27,
                                              decoration: BoxDecoration(
                                                color: navBarItem,
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.av_timer_outlined,size: 17,color: Colors.white,),
                                                  SizedBox(width: 5,),
                                                  infos.preparationMinutes - 0 < 0 ? Text("Prep Time 0m",style: TextStyle(color: Colors.white,fontSize: 12),) : Text("Prep Time ${infos.preparationMinutes}m",style: TextStyle(color: Colors.white,fontSize: 12),)
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 27,
                                              decoration: BoxDecoration(
                                                color: navBarItem,
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.local_dining_outlined,size: 17,color: Colors.white,),
                                                  SizedBox(width: 5,),
                                                  Text("Servings ${infos.servings}",style: TextStyle(color: Colors.white,fontSize: 12),)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 25,),
                                      Text("About recipe",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                                      SizedBox(height: 10,),
                                      Expanded(child: SingleChildScrollView(scrollDirection: Axis.vertical,child: Text(infos.instructions,style: TextStyle(fontSize: 15),softWrap: true,))),
                                    ],
                                  );
                                }else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              },
                          ),
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
