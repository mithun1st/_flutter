import 'package:api/models/profile.dart';
import 'package:http/http.dart';

class RemoteServer {
  Future<dynamic> fetchData() async {

    const String url = 'https://jsonplaceholder.typicode.com/users';
    final Uri uri = await Uri.parse(url);

    Response response = await get(uri);

    if (response.statusCode == 200) {
      print('success');
      return profileFromJson(response.body);
    }
    throw 'errrrrorrrr--------';
  }
}
