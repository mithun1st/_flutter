import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme/bloc/theme_bloc.dart';

class MyAppScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppScreenState();
  }
}

class MyAppScreenState extends State<MyAppScreen> {
  bool _sw = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Theme'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cloud)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChangeEvent(false));
                },
                child: Text('Light')),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChangeEvent(true));
                  //
                },
                child: Text('Dark')),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home),
            Text(
              'Hello World',
              //pick the theme value
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              'Example of Theme',
              //pick the theme value
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Switch(
                value: _sw,
                onChanged: (_) {
                  setState(() {
                    _sw = !_sw;
                  });
                }),
            ElevatedButton(
              child: Text('Button'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                //pick the theme value
                primary: Theme.of(context).toggleableActiveColor,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return Container();
              });
        },
      ),
    );
  }
}
