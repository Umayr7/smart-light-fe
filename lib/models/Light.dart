import 'dart:convert';

List<Light> lightFromJson(String str) => List<Light>.from(json.decode(str).map((x) => Light.fromJson(x)));

String lightToJson(List<Light> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Light {
  Light({
    required this.id,
    required this.inDate,
    required this.outDate,
    required this.timeDifference
  });

  String id;
  DateTime inDate;
  DateTime outDate;
  String timeDifference;

  factory Light.fromJson(Map<String, dynamic> json) => Light(
    id: json["id"],
    inDate: DateTime.parse(json["inDate"]),
    outDate: DateTime.parse(json["outDate"]),
    timeDifference: json["timeDifference"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "inDate": inDate.toIso8601String(),
    "outDate": outDate.toIso8601String(),
    "timeDifference": timeDifference
  };
}
