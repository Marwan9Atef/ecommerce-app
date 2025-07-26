class UserModel {
  UserModel({
    required this.role,
    required this.name,
    required this.email,
  });

  String role;
  String name;
  String email;

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
    role: json["role"],
    name: json["name"],
    email: json["email"],
  );

  Map<dynamic, dynamic> toJson() => {
    "role": role,
    "name": name,
    "email": email,
  };
}