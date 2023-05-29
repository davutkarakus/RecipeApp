class Ingredients {
  Ingredients({
      required this.id,
      required this.name,
      required this.localizedName,
      required this.image,});

  factory Ingredients.fromJson(Map<String,dynamic> json) {
    return Ingredients(id: json['id'] as int, name: json['name'] as String, localizedName: json['localizedName'] as String, image: json['image'] as String);
  }
  int id;
  String name;
  String localizedName;
  String image;

}