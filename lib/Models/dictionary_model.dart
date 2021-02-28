// To parse this JSON data, do final modelDictionary = modelDictionaryFromJson(jsonString);

part of 'models.dart';

List<ModelDictionary> modelDictionaryFromJson(String str) =>
    List<ModelDictionary>.from(
        json.decode(str).map((x) => ModelDictionary.fromJson(x)));

String modelDictionaryToJson(List<ModelDictionary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelDictionary {
  String id, title, content;

  ModelDictionary({
    this.id,
    this.title,
    this.content,
  });

  factory ModelDictionary.fromJson(Map<String, dynamic> json) =>
      ModelDictionary(
        id: json["id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
      };
}
