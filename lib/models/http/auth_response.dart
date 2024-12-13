import 'dart:convert';

class AuthResponse {
  Usuario? usuario;
  String? token;

  AuthResponse({
    this.usuario,
    this.token,
  });

  factory AuthResponse.fromRawJson(String str) =>
      AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        usuario:
            json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario?.toJson(),
        "token": token,
      };
}

class Usuario {
  String? rol;
  bool? estado;
  bool? google;
  String? nombre;
  String? correo;
  String? uid;

  Usuario({
    this.rol,
    this.estado,
    this.google,
    this.nombre,
    this.correo,
    this.uid,
  });

  factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        nombre: json["nombre"],
        correo: json["correo"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "rol": rol,
        "estado": estado,
        "google": google,
        "nombre": nombre,
        "correo": correo,
        "uid": uid,
      };
}
