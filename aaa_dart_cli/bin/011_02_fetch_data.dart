import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

// install with `dart pub add http`
// see https://pub.dev/packages/http
// see https://pub.dev/packages/http/example

void main() async {
  Future<JsonResponse> res = BookApi.pullBooksV01Json(topic: 'http');
  print("res =$res");
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
  static Future<JsonResponse> pullBooksV01Json({required String topic}) async {
    var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{$topic}'});
    var response = await http.get(url);
    JsonResponse jsonResponse = JsonResponse(response.body, response.statusCode);

    return jsonResponse;
  }
}
