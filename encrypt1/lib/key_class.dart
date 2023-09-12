

import 'package:encrypt/encrypt.dart';

class KeyClass extends Encrypted{
  KeyClass(super.bytes);

  
  static final key = Key.fromBase64('xyz1234');

}