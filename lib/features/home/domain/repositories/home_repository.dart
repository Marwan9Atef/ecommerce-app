import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import '../entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failure,List<Category>>>getCategories();


 }