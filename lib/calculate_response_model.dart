import 'dart:convert';

class CalculateResponseModel {
  CalculateResponseModel({
    required this.value,
  });

  int value;

  factory CalculateResponseModel.fromJson(Map<String, dynamic> json) => CalculateResponseModel(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };

  static CalculateResponseModel fromJsonString(String str) =>
      CalculateResponseModel.fromJson(json.decode(str));

  static String toJsonString(CalculateResponseModel data) => json.encode(data.toJson());

}
