import 'dart:convert';

import 'package:apigetpost/main.dart';
import 'package:http/http.dart';

/* //data pattern
[
  {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "sunt qui excepturi placeat culpa"
  },
]

*/

class RemoteServer {
  String url = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<dynamic>?> getDate() async {
    Uri uri = Uri.parse(url);
    try {
      Response response = await get(uri);
      if (response.statusCode == 200) {
        print('Data Get Success');
        final js = jsonDecode(response.body);
        return js;
      }
    } catch (err) {
      print(err);
    }
  }

  postData(Map<String, String> mp) async {
    Uri uri = Uri.parse(url);
    Response response = await post(uri, headers: mp);
    print(response.statusCode);
    if (response.statusCode == 201) {
      print('Data Post Success');
    }
  }
}
