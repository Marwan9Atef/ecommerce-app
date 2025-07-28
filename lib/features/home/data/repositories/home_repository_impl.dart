import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/app_exception.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/home/data/mappers/home_mapper.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
import '../data_sources/remote/home_remote_data_source.dart';
@LazySingleton(as:HomeRepository )
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

 const HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List <Category>>> getCategories() async {
    try {
      final response = await _remoteDataSource.getCategories();
      final categories = response.categories
          .map((category) => category.toEntity)
          .toList();
      return Right(categories);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}