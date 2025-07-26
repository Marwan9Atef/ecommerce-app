import 'package:ecommerce/features/auth/data/models/user_model.dart';

class RegisterResponse {
  RegisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  String message;
  UserModel user;
  String token;

  factory RegisterResponse.fromJson(Map<dynamic, dynamic> json) => RegisterResponse(
    message: json["message"],
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
  );

  Map<dynamic, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "token": token,
  };
}


