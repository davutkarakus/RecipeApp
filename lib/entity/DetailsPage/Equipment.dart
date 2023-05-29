class Equipment {
  Equipment({
      required this.id,
      required this.name,
      required this.localizedName,
      required this.image,});

  factory Equipment.fromJson(Map<String,dynamic> json) {
   return Equipment(id: json["id"] as int , name: json["name"] as String , localizedName: json["localizedName"] as String, image: json["image"] as String );
  }
  int id;
  String name;
  String localizedName;
  String image;

}