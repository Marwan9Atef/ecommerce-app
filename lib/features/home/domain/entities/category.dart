import 'package:equatable/equatable.dart';
class Category extends Equatable{
final  String name;
final  String id;
final  String imageURL;
 const Category({
    required this.name,
    required this.id,
    required this.imageURL,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];


}