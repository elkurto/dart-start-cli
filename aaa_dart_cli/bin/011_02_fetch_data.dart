import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// install with `dart pub add http`
// see https://pub.dev/packages/http
// see https://pub.dev/packages/http/example

void main() {
  Future<JsonResponse> res = BookApi.pullBooksV01Json(topic: 'http');
  res.then((res) {
    print("res =$res");
  });
}

class JsonResponse {
  String responseText;
  int statusCode; // e.g. 200

  JsonResponse(this.responseText, this.statusCode);

  @override
  String toString() {
    return "JsonResponse($statusCode, $responseText)";
  }
}

class BookApi {
  // https://www.googleapis.com/books/v1/volumes?q={http}
  static Future<JsonResponse> pullBooksV01Json({required String topic}) async {
    var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{$topic}'});
    http.Response response = await http.get(url);
    JsonResponse jsonResponse = JsonResponse(response.body, response.statusCode);

    return jsonResponse;
  }

  // https://jsonplaceholder.typicode.com/guide/
  // https://jsonplaceholder.typicode.com/posts/1
  //    - // returns a response.body ={ userid:1, id:1, title:"xx", body:"..."
  //           }
  static Future<http.Response> pullFromTypicode() {
    var url = Uri.https("jsonplaceholder.typicode.com/", "posts/1");
    Future<http.Response> futureOfResponse = http.get(url);
    return futureOfResponse;
  }
}
