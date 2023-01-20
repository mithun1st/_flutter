import 'dart:io';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox1/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  static late Store store;

  static Future<void> init() async {
    // getLibraryDirectory().then((value) => print(value));
    // getDownloadsDirectory().then((value) => print(value));
    getTemporaryDirectory().then((value) => print(value));
    getExternalCacheDirectories().then((value) => print(value));
    getExternalStorageDirectories().then((value) => print(value));
    getExternalStorageDirectory().then((value) => print(value));

    store = await openStore();
  }
}
