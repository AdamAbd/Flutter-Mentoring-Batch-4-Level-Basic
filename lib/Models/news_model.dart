// To parse this JSON data, do final modelNews = modelNewsFromJson(jsonString);

part of 'models.dart';

List<ModelNews> modelNewsFromJson(String str) =>
    List<ModelNews>.from(json.decode(str).map((x) => ModelNews.fromJson(x)));

String modelNewsToJson(List<ModelNews> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelNews {
  String id, title, writter, content, picture;
  DateTime registrationDate;

  ModelNews({
    this.id,
    this.title,
    this.writter,
    this.content,
    this.picture,
    this.registrationDate,
  });

  factory ModelNews.fromJson(Map<String, dynamic> json) => ModelNews(
        id: json["id"],
        title: json["title"],
        writter: json["writter"],
        content: json["content"],
        picture: json["picture"],
        registrationDate: DateTime.parse(json["registrationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "writter": writter,
        "content": content,
        "picture": picture,
        "registrationDate": registrationDate.toIso8601String(),
      };
}
