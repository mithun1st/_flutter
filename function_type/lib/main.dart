import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Function Type'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  //normal fnc
  void f0() {
    print('Normal Function calling');
  }

  //variable of void fnc
  Function() f1 = () {
    print('variable with void fnc');
  };

  //variable of argument fnc
  Function f2 = (String s1, String s2) {
    print('variable with argument fnc. ex: ${s1+s2}');
  };




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        //normal
        ElevatedButton(
          onPressed: f0,
          child: const Text('normal fnc'),
        ),
        
        //anonymous
        ElevatedButton(
          onPressed: () {
            print('which has no name');
          },
          child: const Text('anonymous'),
        ),

        //variable of void fnc
        ElevatedButton(
          onPressed: f1,
          child: const Text('variable of void fnc'),
        ),

        //variable with argument fnc
        ElevatedButton(
          onPressed: () => f2('B', 'D'),
          child: const Text('variable with argument fnc'),
        ),
      ],
    );
  }
}
