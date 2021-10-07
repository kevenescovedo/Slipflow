import 'dart:convert';

class User {
  final String? displayNome;
  final String? photoUrl;
  final String email;
  User({required this.displayNome, this.photoUrl, required this.email});
  Map<String, dynamic> tomMap() {
    return {
      "displayName": this.displayNome,
      "photoUrl": this.photoUrl,
      "email": this.email,
    };
  }

  String toJson() => jsonEncode(tomMap());
  factory User.fromMap(Map<String, dynamic> mapa) {
    return User(
        displayNome: mapa["displayName"],
        email: mapa["email"],
        photoUrl: mapa["photoUrl"]);
  }
  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));

}
