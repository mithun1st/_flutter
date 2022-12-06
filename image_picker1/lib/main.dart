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

  //image size mb/kb
  double getFileSize(File file) {
    int sizeInBytes = file.lengthSync();
    double sizeInKb = sizeInBytes / 1024;
    return sizeInKb;
  }

  //fnc dec
  void getPic(ImageSource src) async {
    XFile? xf = await ImagePicker().pickImage(source: src);
    imageFile = File(xf!.path);
    print(xf.path);
    print(xf.name);
    getFileSize(File(xf.path));
    //
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image_picker'),
      ),
      body: Center(
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
    );
  }
}
