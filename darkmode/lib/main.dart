import 'package:darkmode/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.dartTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isDark);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode / Light Mode'),
        actions: [
          Switch(
            value: isDark,
            onChanged: (value) => setState(() => isDark = value),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: FONTCOLOR1),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Click')),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            DropdownButton(
              value: 1,
              items: const [
                DropdownMenuItem(value: 1, child: Text('System')),
                DropdownMenuItem(value: 2, child: Text('Dark')),
                DropdownMenuItem(value: 3, child: Text('Light')),
              ],
              onChanged: (value) {
                print(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
