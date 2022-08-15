import 'package:objectbox1/models/con_file.dart';

import '../objectbox.g.dart';

class ObjectBox {
  final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final Store store = await openStore();
    return ObjectBox._create(store);
  }
}
