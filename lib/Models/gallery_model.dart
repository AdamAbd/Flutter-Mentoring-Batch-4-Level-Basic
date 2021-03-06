part of 'models.dart';

// To parse this JSON data, do final modelGallery = modelGalleryFromJson(jsonString);

List<ModelGallery> modelGalleryFromJson(String str) => List<ModelGallery>.from(
    json.decode(str).map((x) => ModelGallery.fromJson(x)));

String modelGalleryToJson(List<ModelGallery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelGallery {
  ModelGallery({
    this.id,
    this.title,
    this.picture,
    this.photo,
    this.content,
  });

  String id;
  String title;
  String picture;
  String photo;
  String content;

  factory ModelGallery.fromJson(Map<String, dynamic> json) => ModelGallery(
        id: json["id"],
        title: json["title"],
        picture: json["picture"],
        photo: json["photo"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "picture": picture,
        "photo": photo,
        "content": content,
      };
}
