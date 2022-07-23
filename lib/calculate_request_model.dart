import 'dart:convert';

class CalculateRequestModel {
  CalculateRequestModel({
    required this.value,
  });

  int value;

  factory CalculateRequestModel.fromJson(Map<String, dynamic> json) =>
      CalculateRequestModel(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };

  static CalculateRequestModel fromJsonString(String str) =>
      CalculateRequestModel.fromJson(json.decode(str));

  static String toJsonString(CalculateRequestModel data) =>
      json.encode(data.toJson());
}
