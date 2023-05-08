
import 'package:flutter_recipe_app/entity/MainPage/Results.dart';

class RecipeResponse{
  List<Results> results;
  int offset;
  int number;
  int totalResults;

  RecipeResponse({required this.results,required this.offset,required this.number,required this.totalResults});

  factory RecipeResponse.fromJson(Map<String,dynamic> json) {
    var jsonArray = json["results"] as List;
    List<Results> results  = jsonArray.map((jsonArrayNesnesi) => Results.fromJson(jsonArrayNesnesi)).toList();
    return RecipeResponse(results: results, offset: json["offset"] as int, number: json["number"] as int, totalResults: json["totalResults"] as int);

  }
}