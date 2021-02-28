part of 'models.dart';

// To parse this JSON data, do final modelGallery = modelGalleryFromJson(jsonString);

List<ModelGallery> modelGalleryFromJson(String str) => List<ModelGallery>.from(
    json.decode(str).map((x) => ModelGallery.fromJson(x)));

String modelGalleryToJson(List<ModelGallery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelGallery {
  String id, title, photo, level, dataWhat, dataUnique, dataPlus, dataMinus;

  ModelGallery({
    this.id,
    this.title,
    this.photo,
    this.level,
    this.dataWhat,
    this.dataUnique,
    this.dataPlus,
    this.dataMinus,
  });

  factory ModelGallery.fromJson(Map<String, dynamic> json) => ModelGallery(
        id: json["id"],
        title: json["title"],
        photo: json["photo"],
        level: json["level"],
        dataWhat: json["dataWhat"],
        dataUnique: json["dataUnique"],
        dataPlus: json["dataPlus"],
        dataMinus: json["dataMinus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "photo": photo,
        "level": level,
        "dataWhat": dataWhat,
        "dataUnique": dataUnique,
        "dataPlus": dataPlus,
        "dataMinus": dataMinus,
      };
}
