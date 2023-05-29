import 'dart:convert';

import 'ExtendedIngredients.dart';
import 'AnalyzedInstructions.dart';

class RecipeDetailResponse {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  bool lowFodmap;
  int weightWatcherSmartPoints;
  String gaps;
  int preparationMinutes;
  int cookingMinutes;
  int aggregateLikes;
  int healthScore;
  String creditsText;
  String sourceName;
  double pricePerServing;
  List<ExtendedIngredients> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<String> occasions;
  String instructions;
  List<AnalyzedInstructions> analyzedInstructions;
  String spoonacularSourceUrl;
  RecipeDetailResponse({
      required this.vegetarian,
      required this.vegan,
      required this.glutenFree,
      required this.dairyFree,
      required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required  this.preparationMinutes,
    required  this.cookingMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required  this.sourceUrl,
    required this.image,
    required  this.imageType,
    required this.summary,
    required  this.cuisines,
    required this.dishTypes,
    required  this.diets,
    required  this.occasions,
    required  this.instructions,
    required  this.analyzedInstructions,
    required this.spoonacularSourceUrl,});

    factory RecipeDetailResponse.fromJson(Map<String,dynamic> json) {
      var jsonArray = json["extendedIngredients"] as List;
      List<ExtendedIngredients> extendedIngredients = jsonArray.map((jsonArrayNesnesi) => ExtendedIngredients.fromJson(jsonArrayNesnesi)).toList();

      String jsonString = jsonEncode(json['cuisines']) ;
      List<String> cuisines = List<String>.from(jsonDecode(jsonString));

      String jsonString1 = jsonEncode(json['dishTypes']) ;
      List<String> dishTypes = List<String>.from(jsonDecode(jsonString1));

      String jsonString2 = jsonEncode(json['diets']) ;
      List<String> diets = List<String>.from(jsonDecode(jsonString2));

      String jsonString3 = jsonEncode(json['occasions']) ;
      List<String> occasions = List<String>.from(jsonDecode(jsonString3));

      var jsonArray1 = json["analyzedInstructions"] as List;
      List<AnalyzedInstructions> analyzedInstructions = jsonArray1.map((jsonArrayNesnesi) => AnalyzedInstructions.fromJson(jsonArrayNesnesi)).toList();

    return RecipeDetailResponse(vegetarian: json['vegetarian'] as bool, vegan: json['vegan'] as bool , glutenFree: json['glutenFree'] as bool, dairyFree: json['dairyFree'] as bool, veryHealthy: json['veryHealthy'] as bool, cheap: json['cheap'] as bool, veryPopular: json['veryPopular'] as bool, sustainable: json['sustainable'] as bool, lowFodmap: json['lowFodmap'] as bool, weightWatcherSmartPoints: json['weightWatcherSmartPoints'] as int, gaps: json['gaps'] as String, preparationMinutes: json['preparationMinutes'] as int, cookingMinutes: json['cookingMinutes'] as int, aggregateLikes: json['aggregateLikes'] as int, healthScore: json['healthScore'] as int, creditsText: json['creditsText'] as String, sourceName: json['sourceName'] as String, pricePerServing: json['pricePerServing'] as double, extendedIngredients: extendedIngredients, id: json['id'] as int, title: json['title'] as String, readyInMinutes: json['readyInMinutes'] as int, servings: json['servings'] as int, sourceUrl: json['sourceUrl'] as String, image: json['image'] as String, imageType: json['imageType'] as String, summary: json['summary'] as String, cuisines: cuisines, dishTypes: dishTypes, diets: diets, occasions: occasions, instructions: json['instructions'] as String, analyzedInstructions: analyzedInstructions, spoonacularSourceUrl: json['spoonacularSourceUrl'] as String);
  }

}