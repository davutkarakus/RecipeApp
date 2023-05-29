import 'Steps.dart';

class AnalyzedInstructions {
  AnalyzedInstructions({
      required this.name,
      required this.steps,});

  factory AnalyzedInstructions.fromJson(Map<String,dynamic> json) {
    var jsonArray = json["steps"] as List;
    List<Steps> steps = jsonArray.map((jsonArrayNesnesi) => Steps.fromJson(jsonArrayNesnesi)).toList();
    return AnalyzedInstructions(name: json['name'] as String, steps: steps);
  }
  String name;
  List<Steps> steps;
}