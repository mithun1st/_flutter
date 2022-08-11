import 'package:api/models/profile.dart';
import 'package:http/http.dart' as http;

class RemoteServer {
  Future<dynamic> fetchData() async {
    http.Client client = http.Client();

    const String url = 'https://jsonplaceholder.typicode.com/users';
    final Uri uri = await Uri.parse(url);

    http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      print('success');
      return profileFromJson(response.body);
    }
    throw 'errrrrorrrr--------';
  }
}
