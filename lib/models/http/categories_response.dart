import 'dart:convert';

import 'package:admin_dashboard/models/category.dart';

class CategoriesResponse {
  int? total;
  List<Category>? categorias;

  CategoriesResponse({
    this.total,
    this.categorias,
  });

  factory CategoriesResponse.fromRawJson(String str) =>
      CategoriesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        total: json["total"],
        categorias: json["categorias"] == null
            ? []
            : List<Category>.from(
                json["categorias"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "categorias": categorias == null
            ? []
            : List<dynamic>.from(categorias!.map((x) => x.toJson())),
      };
}
