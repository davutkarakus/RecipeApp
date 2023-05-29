
class ExtendedIngredients {
  ExtendedIngredients({
      required this.id,
      required this.aisle,
      required this.image,
      required this.consistency,
      required this.name,
      required this.nameClean,
      required this.original,
      required this.originalName,
      required this.amount,
      required this.unit,});

  //META SİLİNDİ

   factory ExtendedIngredients.fromJson(dynamic json) {
    return ExtendedIngredients(id: json['id'] as int, aisle: json['aisle'] as String, image: json['image'] as String, consistency: json['consistency'] as String, name: json['name'] as String, nameClean: json['nameClean'] as String, original: json['original'] as String, originalName: json['originalName'] as String, amount: json['amount'] as double, unit: json['unit'] as String);
  }
  int id;
  String aisle;
  String image;
  String consistency;
  String name;
  String nameClean;
  String original;
  String originalName;
  double amount;
  String unit;
}