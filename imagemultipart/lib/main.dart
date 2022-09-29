import 'dart:io';

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
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //file variable
  File? imageFile;

  //fnc dec
  void getPic(ImageSource src) async {
    XFile? xf = await ImagePicker().pickImage(source: src);
    print('--------');
    
    String fileName = hash(xf?.path);
    imageFile = File(xf!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image to json'),
      ),
      body: Center(
        child: Center(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
