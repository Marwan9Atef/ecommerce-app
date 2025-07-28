import 'package:equatable/equatable.dart';


class User extends Equatable {
 const User({
    required this.role,
    required this.name,
    required this.email,
  });

 final String role;
 final String name;
 final String email;

  @override

  List<Object?> get props => [email];

}