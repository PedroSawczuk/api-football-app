import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<http.Response> get({required String url});
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<http.Response> get({required String url}) async {
    final headers = {
      'x-apisports-key': '3dcc6ec22ca46f683f3374f1e7b4dd7f', 
    };
    return await client.get(Uri.parse(url), headers: headers);
  }
}
