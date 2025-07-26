import 'package:equatable/equatable.dart';


class User extends Equatable {
  User({
    required this.role,
    required this.name,
    required this.email,
  });

  String role;
  String name;
  String email;

  @override

  List<Object?> get props => [email];

}