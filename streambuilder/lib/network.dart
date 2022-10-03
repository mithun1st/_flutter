import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Network {
  String url = 'https://api.wheretheiss.at/v1/satellites/25544';

  Stream<dynamic> whereIsISSAtt() async* {
    Uri uri = Uri.parse(url);
    while (true) {
      Response res = await get(uri);
      yield jsonDecode(res.body);
    }
  }
}
