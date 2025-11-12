import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/**
 * USAGE:
 * > dart bin/013_01_factory_ctor_photo.dart 
  */

void main() async {
  final List<Photo> listPhoto = await fetchListPhoto();

  for (Photo photo in listPhoto) {
    print(photo);
  }
}

class Photo {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromFakeService(Map<String, dynamic> photoRaw) {
    int idTemp = photoRaw['id'];
    int albumIdTemp = photoRaw['albumId'];
    String titleTemp = photoRaw['title'];
    String urlTemp = photoRaw['url'];
    String thumbnailUrlTemp = photoRaw['thumbnailUrl'];

    return Photo(
      id: idTemp,
      albumId: albumIdTemp,
      title: titleTemp,
      url: urlTemp,
      thumbnailUrl: thumbnailUrlTemp,
    );
  }

  @override
  String toString() {
    return "Photo(id=$id,albumId=$albumId,title=$title)";
  }
}

Future<List<Photo>> fetchListPhoto() async {
  // https://jsonplaceholder.typicode.com/photos
  Uri uri = Uri.https('jsonplaceholder.typicode.com', '/photos');

  final response = await http.get(uri);

  final List<dynamic> data = convert.jsonDecode(response.body);

  List<Photo> listPhoto = data.map((photoRaw) => Photo.fromFakeService(photoRaw)).toList();

  return listPhoto;
}
