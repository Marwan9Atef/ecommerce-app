import '../../domain/entities/category.dart';

abstract class HomeState {

}
class HomeInitial extends HomeState {}
class CategoryLoading extends HomeState {}
class CategoryLoaded extends HomeState {
  final List<Category> categories;
  CategoryLoaded(this.categories);
}
class CategoryError extends HomeState {
  final String message;
  CategoryError(this.message);
}