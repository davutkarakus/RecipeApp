
class Results {
  int id;
  String title;
  String image;
  String imageType;

  Results({required this.id,required this.title,required this.image,required this.imageType});

  factory Results.fromJson(Map<String,dynamic> json) {
    return Results(
        id: json["id"] as int,
        title: json["title"] as String,
        image: json["image"] as String,
        imageType: json["imageType"] as String
    );

  }
}