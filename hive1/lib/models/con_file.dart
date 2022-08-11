import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
part 'con_file.g.dart';

@HiveType(typeId: 0)
class Contact extends ChangeNotifier {
  @HiveField(0)
  late final String name;

  @HiveField(1)
  late final String num;

  Contact({this.name = 'x', this.num = '0'});
}
