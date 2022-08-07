import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //variable
  int? num;
  double? pi;
  String? str;
  bool? sw = false;

  TextEditingController intCtrl = TextEditingController();
  TextEditingController doubleCtrl = TextEditingController();
  TextEditingController stringCtrl = TextEditingController();

  Future<SharedPreferences> sp = SharedPreferences.getInstance();

  //

  void save() async {
    SharedPreferences spv = await sp;
    spv.setInt('intKey', int.parse(intCtrl.text));
    spv.setDouble('doubleKey', double.parse(doubleCtrl.text));
    spv.setString('stringKey', stringCtrl.text);
    spv.setBool('boolKey', sw!);
    print('Save!');
  }

  Future<void> load() async {
    setState(() {});
    SharedPreferences spv = await sp;
    num = spv.getInt('intKey');
    pi = spv.getDouble('doubleKey');
    str = spv.getString('stringKey');
    sw = spv.getBool('boolKey');
  }

  void updateWid() {
    intCtrl.text = num.toString();
    doubleCtrl.text = pi.toString();
    stringCtrl.text = str.toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared_preferences'),
      ),
      body: Column(
        children: [
          TextField(
            controller: intCtrl,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: 'type int'),
          ),
          TextField(
            controller: doubleCtrl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'type double'),
          ),
          TextField(
            controller: stringCtrl,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'type int'),
          ),
          //Text(s.toString()),
          Switch(
            value: sw ?? false,
            onChanged: (s) {
              sw = s;
              setState(() {});
            },
          ),

          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => save(),
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  load();
                  updateWid();
                },
                child: const Text(
                  'Load\nifNotWorkpressTwice',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )

          //
        ],
      ),
    );
  }
}
