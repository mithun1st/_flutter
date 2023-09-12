import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//------------
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  void dataFromCSV() async {
    final String rawData = await rootBundle.loadString("assets/ex.csv");
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(rawData);
    print(rowsAsListOfValues);
  }

  void dataToCSV() {
    List<List<dynamic>> stu = [
      ["Name,Roll,IsMale"],
      ["Mahadi", 23, true],
      ["Hasan", 16, true],
      ["Ms Y", 12, false],
    ];

    final String csv = const ListToCsvConverter().convert(stu);
    print(csv);
  }

  void chooseCSVfromFile() async {
    //incase error
    //>>flutter clean
    //>>flutter pub get
    //>>flutter run
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSV Upload/Download'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                dataToCSV();
              },
              child: const Text('Upload')),
          ElevatedButton(
              onPressed: () {
                chooseCSVfromFile();
              },
              child: const Text('Choose')),
          ElevatedButton(
              onPressed: () {
                dataFromCSV();
              },
              child: const Text('Download')),
        ],
      ),
    );
  }
}
