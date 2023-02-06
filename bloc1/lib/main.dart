import 'dart:io';

import 'package:bloc1/bloc/api/bloc/api_bloc.dart';
import 'package:bloc1/bloc/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ApiBloc()),
        BlocProvider(create: (context) => CountBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  bool sw1 = false;
  bool sw2 = true;
  TextEditingController ctrl = TextEditingController(text: 'Loading...');

  void setTextToTextField(String s) {
    ctrl.text = s;
  }

  @override
  void initState() {
    // BlocProvider.of<CountBloc>(context)
    //     .add(CountLoadedEvent(setTextToTextField));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('-----------------------Widget Builder');

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
        actions: [
          IconButton(
              onPressed: () => BlocProvider.of<CountBloc>(context)
                  .add(CountLoadedEvent(setTextToTextField)),
              icon: const Icon(Icons.restart_alt))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //1st section
            BlocBuilder<CountBloc, CountState>(
              builder: (context, state) {
                int c = 99;
                if (state is CountInitialState) {
                  return const CircularProgressIndicator();
                } else if (state is CountLoadedState) {
                  c = state.probs[0];
                }
                return Text(
                  c.toString(),
                  style: const TextStyle(backgroundColor: Colors.yellow),
                );
              },
            ),
            //2nd section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    count--;
                    BlocProvider.of<CountBloc>(context)
                        .add(CountIncDecEvent(count));
                  },
                  child: const Text('--'),
                ),
                ElevatedButton(
                  onPressed: () {
                    count++;
                    BlocProvider.of<CountBloc>(context)
                        .add(CountIncDecEvent(count));
                  },
                  child: const Text('++'),
                ),
              ],
            ),
            //3rd section
            BlocBuilder<CountBloc, CountState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Switch(
                      value: sw1,
                      onChanged: (value) {
                        sw1 = value;
                        BlocProvider.of<CountBloc>(context)
                            .add(CountAllEvent());
                      },
                    ),
                    Switch(
                      value: sw2,
                      onChanged: (value) {
                        sw2 = value;
                        BlocProvider.of<CountBloc>(context)
                            .add(CountAllEvent());
                      },
                    ),
                  ],
                );
              },
            ),
            //4th section
            TextField(
              controller: ctrl,
            ),
            //5th section
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CountBloc>(context)
                      .add(CountSaveEvent(count, ctrl.text));
                },
                child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
