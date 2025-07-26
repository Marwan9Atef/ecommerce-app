import 'package:ecommerce/core/constant/constant.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_date_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/error/app_exception.dart';
@Singleton(as: AuthLocalDateSource)
class AuthSharedPreferenceDataSource implements AuthLocalDateSource {
  final SharedPreferences _prefs;
 const AuthSharedPreferenceDataSource(this._prefs);
  @override
  Future<void> saveToken(String token) async {
    try {
      await _prefs.setString(LocalStorageConstant.tokenKey, token);
    }catch (exception) {
      throw const LocalException("Failed to save token");
    }
  }
  @override
  Future<String> getToken() async {
    try {
      return _prefs.getString(LocalStorageConstant.tokenKey)!;
    }catch(exception) {
      throw const LocalException("Failed to get token");
    }
  }

}