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
  @override
  Widget build(BuildContext context) {
    print('-----------------------Widget Builder');

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  count++;
                  //---------------------Event 1
                  BlocProvider.of<CountBloc>(context).add(CountIncEvent(count));
                },
                child: Text('++')),
            ElevatedButton(
                onPressed: () {
                  count--;
                  //---------------------Event 2
                  BlocProvider.of<CountBloc>(context).add(CountDecEvent(count));
                },
                child: Text('--')),
            //-----------------Bloc Builder (widget)
            BlocBuilder<CountBloc, CountState>(
              builder: (context, state) {
                if (state is CountInitial) {
                  return Text('value: xxx');
                } else if (state is CountPrintLoadedState) {
                  return const CircularProgressIndicator();
                } else if (state is CountPrintState) {
                  return Text('Value: ${state.c}');
                } else {
                  return Text('Error');
                }
              },
            ),
            //-----------------Bloc Listener (snackbar)
            BlocListener<CountBloc, CountState>(
              listener: (context, state) {
                if (state is CountPrintState) {
                  //----snackbar
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('waiting'),
                    duration: const Duration(seconds: 1),
                  ));
                  //------snackbar/
                }
              },
            ),
            //-----------------Bloc Consumer (widget+snackbar)
            BlocConsumer<CountBloc, CountState>(
              listener: (context, state) {
                if (state is CountPrintState) {
                  //----snackbar
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('snack'),
                    duration: const Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'ACTION',
                      onPressed: () {
                        count = 0;
                      },
                    ),
                  ));
                  //------snackbar/
                }
              },
              builder: (context, state) {
                return Text('--------');
              },
            ),
          ],
        ),
      ),
    );
  }
}
