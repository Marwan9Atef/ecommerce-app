import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'home_state.dart';
@lazySingleton
class HomeCubit extends Cubit<HomeState> {
 final GetCategories _getCategories;
  HomeCubit(this._getCategories) : super(HomeInitial()){
getCategories();
  }
  Future<void>getCategories() async {
    emit(CategoryLoading());
    final result = await _getCategories();
    result.fold(
      (failure) => emit(CategoryError(failure.message)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }

}
