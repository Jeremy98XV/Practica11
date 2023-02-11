
import 'package:http/http.dart' as http;

import '../models/photo.dart';

class PhotoService {
  // Obtengo los valores del API REST
  Future<List<Photo>?> getPhoto() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return photoFromJson(json);
    }
  }
}
