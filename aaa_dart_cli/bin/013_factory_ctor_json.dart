//import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/**
 * USAGE:
 * > dart bin/013_factory_ctor_json.dart 
 *   Book(id=1,name=satan burger,isbn=1111-1111-1111-11)
 *   Book(id=2,name=ultra f*ers,isbn=1111-1111-1111-12)
 */

void main() async {
  final List<Book> listBook = await fetchListBook();

  for (Book book in listBook) {
    print(book);
  }
}

class Book {
  final int id;
  final String name;
  final String isbn;
  Book({required this.id, required this.name, required this.isbn});

  factory Book.fromFakeService(Map<String, dynamic> bookRaw) {
    int idTemp = bookRaw['id'];
    String nameTemp = bookRaw['name'];
    String isbnTemp = bookRaw['isbn'];

    return Book(id: idTemp, name: nameTemp, isbn: isbnTemp);
  }

  @override
  String toString() {
    return "Book(id=$id,name=$name,isbn=$isbn)";
  }
}

Future<List<Book>> fetchListBook() async {
  return Future.delayed(Duration(seconds: 2), () {
    final String jsonBooks = createStringJsonBooks();
    final List<dynamic> data = convert.jsonDecode(jsonBooks);
    return data.map((bookRaw) => Book.fromFakeService(bookRaw)).toList();
  });
}

String createStringJsonBooks() {
  return '[{"id":1,"name":"satan burger","isbn":"1111-1111-1111-11"} '
      ',{"id":2,"name":"ultra f*ers" ,"isbn":"1111-1111-1111-12"}'
      ']';
}
