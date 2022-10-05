import 'dart:async';
import 'dart:typed_data';

import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

class CallerId {
  CallerId() {
    UsbSerial.usbEventStream!.listen((UsbEvent event) {
      _getPorts();
    });

    _getPorts();
  }

  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;
  UsbDevice? _device;

  UsbPort? _port;
  bool _readyForAtCommand = true;
  String _callStatus = 'x';

  Stream<String> getCallStatus() async* {
    yield* Stream.periodic(Duration(milliseconds: 100), (int a) {
      return _callStatus;
    });
  }

  void _getPorts() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (!devices.contains(_device)) {
      _connectTo(null);
    }
    if (_device == null) {
      for (int i = 0; i < devices.length; i++) {
        if (devices[i].productName!.contains('Modem')) {
          _connectTo(devices[i]);
          break;
        }
      }
    }
  }

  Future<bool> _connectTo(UsbDevice? device) async {
    if (_subscription != null) {
      _subscription!.cancel();
      _subscription = null;
    }

    if (_transaction != null) {
      _transaction!.dispose();
      _transaction = null;
    }

    if (_port != null) {
      _port!.close();
      _port = null;
    }

    if (device == null) {
      _device = null;

      _readyForAtCommand = true;
      return true;
    }

    _port = await device.create();
    if (await (_port!.open()) != true) {
      return false;
    }
    _device = device;

    _transaction = Transaction.stringTerminated(
        _port!.inputStream as Stream<Uint8List>, Uint8List.fromList([13, 10]));

    if (_readyForAtCommand) {
      await _port!.write(Uint8List.fromList('AT+VCID=1\r\n'.codeUnits));
      _readyForAtCommand = false;
    }
    _subscription = _transaction!.stream.listen((String line) {
      _callStatus = line + _callStatus + '\n';
    });

    return true;
  }
}
