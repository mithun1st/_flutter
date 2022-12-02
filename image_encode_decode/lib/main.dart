import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //file variable
  File? imageFile;

  Uint8List byte = File(
          "/data/user/0/com.example.image_encode_decode/cache/image_picker4473359951768578265.webp")
      .readAsBytesSync();

  List<int> byteInt = File(
          "/data/user/0/com.example.image_encode_decode/cache/image_picker4473359951768578265.webp")
      .readAsBytesSync();

  String base64 = '';



  //fnc dec
  void getPic(ImageSource src) async {
    XFile? xf = await ImagePicker().pickImage(source: src);
    imageFile = File(xf!.path);
    print(xf.path);
    //--------------------------
    print('--------------------');

    setState(() {});
  }

//--------------------------------------------------Decode Section
  Future<File?> loadImage() async {
    File? file;

    Uint8List byte1 = imageFile!.readAsBytesSync();
    
    file = await File('/data/user/0/com.example.image_encode_decode/cache/ex1.webp').writeAsBytes(byte1);
    
    return file;
  }
  //-----------------------------------------Decode Section/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image_picker'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // image view
              imageFile == null
                  ? const Text('NO Photo')
                  : Card(
                      elevation: 20,
                      child: Image.file(
                        imageFile!,
                        height: 500,
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    ),

              // camera button - gallery button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera),
                    onPressed: () => getPic(ImageSource.camera),
                  ),
                  IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () => getPic(ImageSource.gallery),
                  ),
                ],
              ),



              FutureBuilder(
                future: loadImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...');
                  } else {
                    return Card(
                      elevation: 20,
                      child: Image.file(
                        //File("/data/user/0/com.example.image_encode_decode/cache/image_picker4473359951768578265.webp"),
                        snapshot.data!,

                        height: 200,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    );
                  }
                },
              ),

              Text(byte.length.toString()),
              Text(byteInt.length.toString()),
              TextField(
                controller: TextEditingController(text: byte.toString()),
                readOnly: true,
              ),
              TextField(
                controller: TextEditingController(text: base64),
                readOnly: true,
              ),
              Text(byte.toString()),
              Text('\n----------------\n'),
              Text(base64),
            ],
          ),
        ),
      ),
    );
  }
}
