

class ApiEndPoints{
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static var authEndpoints = _AuthEndPoints();
}
class _AuthEndPoints {
  final String registerEmail = '/posts';
  final String loginEmail = '/comments';

}