import 'package:objectbox/objectbox.dart';

@Entity()
class Contact {
  int? id;
  final String name;
  final String num;

  Contact(this.name, this.num);
}
