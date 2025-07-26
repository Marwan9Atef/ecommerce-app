abstract class AuthLocalDateSource {
  Future<void>saveToken(String token);
  Future<String>getToken();

}