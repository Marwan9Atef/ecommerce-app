import '../../domain/entities/user.dart';
import '../models/user_model.dart';

extension UserMapper on UserModel{
  User get toEntity =>
     User(
      role: role,
      name: name,
      email: email,
    );
  }



