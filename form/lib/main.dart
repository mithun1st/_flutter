import 'package:flutter/material.dart';

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
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  String userName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('From'),
      ),
      body: Column(
        children: [
          //------------------------------form
          Form(
            key: key1,
            child: Column(
              children: [
                //unsername
                TextFormField(
                  decoration: InputDecoration(hintText: 'User Name'),
                  onSaved: (newValue) => userName = newValue ?? '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field is empty';
                    }
                  },
                ),
                //email
                TextFormField(
                  decoration: InputDecoration(hintText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => email = newValue ?? '',
                  validator: (value) {
                    if (!value!.contains('@')) {
                      return 'invalid email';
                    }
                  },
                ),
                //password
                TextFormField(
                  decoration: InputDecoration(hintText: 'User Name'),
                  onSaved: (newValue) => password = newValue ?? '',
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'password less then 6';
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              bool isFromValid = key1.currentState!.validate();
              if (isFromValid) {
                key1.currentState!.save();
              }
              setState(() {});
            },
            child: const Text('Submitted'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Data:\n$userName\t$email\t$password'),
        ],
      ),
    );
  }
}
