
import 'dart:convert';

List<Rest> restFromJson(String str) => List<Rest>.from(json.decode(str).map((x) => Rest.fromJson(x)));

String restToJson(List<Rest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rest {
    Rest({
        required this.userId,
        required this.id,
        required this.title,
        this.body,
    });

    int userId;
    int id;
    String title;
    String? body;

    factory Rest.fromJson(Map<String, dynamic> json) => Rest(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
