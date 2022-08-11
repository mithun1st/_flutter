import 'dart:convert';
import 'package:apimodel/models/user_model.dart';
import 'package:http/http.dart';

class RemoteServer {
  String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchDataAsaModel() async {
    Uri uri = Uri.parse(url);
    Response response = await get(uri);

    if (response.statusCode == 200) {
      final js = jsonDecode(response.body);
      print(js.runtimeType);
      _asModel(js);
      return _asModel(js);
    } else {
      throw '';
    }
  }

  List<User> _asModel(List<dynamic> js) {
    //-----
    List<Geo> geo = [];
    for (var i in js) {
      geo.add(
        Geo(
          i['address']['geo']['lat'],
          i['address']['geo']['lng'],
        ),
      );
    }
    //print(geo[0].lng);

    //-----
    List<Address> address = [];
    for (var i in js) {
      int c = 0;
      address.add(
        Address(
          i['address']['street'],
          i['address']['suite'],
          i['address']['city'],
          i['address']['zipcode'],
          geo[c],
        ),
      );
      c++;
    }
    //print(address[0].geo.lng);

    //-----
    List<Company> company = [];
    for (var i in js) {
      company.add(
        Company(
          i['company']['name'],
          i['company']['catchPhrase'],
          i['company']['bs'],
        ),
      );
    }
    //print(company[0].catchPhrase);

    //-------
    List<User> listUser = [];
    for (var i in js) {
      int c = 0;
      listUser.add(
        User(
          i['id'],
          i['name'],
          i['username'],
          i['email'],
          address[c],
          i['phone'],
          i['website'],
          company[c],
        ),
      );
      c++;
    }
    //print(list[0].email.toString());
    return listUser;
  }
}
