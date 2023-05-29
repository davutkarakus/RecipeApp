import 'Ingredients.dart';
import 'Equipment.dart';

class Steps {
  Steps({
      required this.number,
      required this.step,
      required this.ingredients,
      required this.equipment,});

  factory Steps.fromJson(Map<String,dynamic> json) {
    var jsonArray = json["ingredients"] as List;
    List<Ingredients> ingredients = jsonArray.map((jsonArrayNesnesi) => Ingredients.fromJson(jsonArrayNesnesi)).toList();
    var jsonArray1 = json["equipment"] as List;
    List<Equipment> equipment = jsonArray1.map((jsonArrayNesnesi) => Equipment.fromJson(jsonArrayNesnesi)).toList();
    return Steps(number: json['number'] as int, step: json['step'] as String, ingredients: ingredients, equipment: equipment);
  }
  int number;
  String step;
  List<Ingredients> ingredients;
  List<Equipment> equipment;

}