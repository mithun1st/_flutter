import 'package:flutter/material.dart';

class Stateful extends StatefulWidget {
  Stateful() {
    print('constructor()');
  }

  @override
  State<StatefulWidget> createState() {
    print('createState()');
    return StatefulState();
  }
}

class StatefulState extends State with WidgetsBindingObserver {
  //-------------
  @override
  void initState() {
    print('initState()');
    //widget binding observer
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  //widget binding observer
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('==> $state');
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependendies()');
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) {
    print('setState()');
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    //widget binding observer
    WidgetsBinding.instance.removeObserver(this);
    print('dispose()');
    super.dispose();
  }

  //-------------
  int i = 0;
  @override
  Widget build(BuildContext context) {
    print('build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful'),
      ),
      body: Column(
        children: [
          Text(i.toString()),
          ElevatedButton(
            onPressed: () {
              setState(() {
                i++;
              });
            },
            child: Text('+'),
          ),
        ],
      ),
    );
  }
}
