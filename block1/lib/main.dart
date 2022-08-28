import 'package:block1/blocs/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CountBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? k}) : super(key: k);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? k}) : super(key: k);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('Build FNc----!');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // context.read<CountBloc>().add(CountIncEvent());
                    BlocProvider.of<CountBloc>(context).add(CountIncEvent());
                  },
                  child: const Text('++'),
                ),
                BlocBuilder<CountBloc, CountState>(
                  builder: (context, state) {
                    if (state is CountIncState) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Chip(label: Text('Hi There'))),
                      // );
                      return Text(state.count.toString());
                    }
                    return Text(CountBloc().i.toString());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
