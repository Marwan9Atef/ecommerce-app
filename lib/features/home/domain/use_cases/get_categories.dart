import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failure/failure.dart';
import '../entities/category.dart';
import '../repositories/home_repository.dart';
@lazySingleton
class GetCategories {
  final HomeRepository _repository;

 const GetCategories(this._repository);
  Future<Either<Failure, List<Category>>> call()=>_repository.getCategories();

}