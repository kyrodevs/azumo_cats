// class Cats {
//   String? gif;

//   Cats({this.gif});

//   factory Cats.fromMap(Map<String, dynamic> map) {
//     final cats = Cats(gif: map['id'] as String);
//     return cats;
//   }

//   Map<String, dynamic> toMap() {
//     return {'id': gif};
//   }

//   String toJson() => json.encode(toMap());

//   factory Cats.fromJson(String source) => Cats.fromMap((json.decode(source)));
// }

// Future<Cats> getCats(int value) async {
//   final response =
//       await http.get(Uri.parse('https://cataas.com/api/cats?tags=gif'));
//   if (response.statusCode == 200) {
//     return Cats.fromJson(json.decode(response.body)[value]);
//   } else {
//     throw Exception('Failed to get cat gifs');
//   }
// }

// To parse this JSON data, do
//
//     final cats = catsFromJson(jsonString);

import 'dart:convert';

List<Cats> catsFromJson(String str) =>
    List<Cats>.from(json.decode(str).map((x) => Cats.fromJson(x)));

String catsToJson(List<Cats> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cats {
  Cats({
    required this.id,
    required this.createdAt,
    required this.tags,
  });

  String id;
  DateTime? createdAt;
  List<String> tags;

  factory Cats.fromJson(Map<String, dynamic> json) => Cats(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
