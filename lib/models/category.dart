import 'dart:convert';

class Category {
  String? id;
  String? nombre;
  _Usuario? usuario;

  Category({
    this.id,
    this.nombre,
    this.usuario,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        nombre: json["nombre"],
        usuario:
            json["usuario"] == null ? null : _Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario?.toJson(),
      };

  @override
  String toString() {
    return 'Categoria: $nombre';
  }
}

class _Usuario {
  String? id;
  String? nombre;

  _Usuario({
    this.id,
    this.nombre,
  });

  factory _Usuario.fromRawJson(String str) =>
      _Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory _Usuario.fromJson(Map<String, dynamic> json) => _Usuario(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
      };
}
