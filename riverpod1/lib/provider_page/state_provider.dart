import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/provider_all.dart';

class StateProviderPage extends StatefulWidget {
  const StateProviderPage({super.key});

  @override
  State<StateProviderPage> createState() => _StateProviderPageState();
}

class _StateProviderPageState extends State<StateProviderPage> {
  @override
  Widget build(BuildContext context) {
    print('build state provider page');
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateProviderPage Example"),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text("set state"),
          )
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          print('build state provider consumer state');
          final int counter = ref.watch(stateProvider);
          //ref listener
          ref.listen(stateProvider, (previous, next) {
            print("listener");
            if (next >= 5) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Warning !")));
            }
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(stateProvider.notifier).state++;
                    },
                    child: const Text("++"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.invalidate(stateProvider);
                    },
                    child: const Text("reset"),
                  ),
                ],
              ),
              Text(counter.toString())
            ],
          );
        },
      ),
    );
  }
}

class StateProviderClearPage extends StatelessWidget {
  const StateProviderClearPage({super.key});
  @override
  Widget build(BuildContext context) {
    print('build state provider page');
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateProvider Cache Clean Example"),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final int counter = ref.watch(stateProviderClear);
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.read(stateProviderClear.notifier).state++;
                        },
                        child: const Text("++"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(stateProviderClear);
                        },
                        child: const Text("reset"),
                      ),
                    ],
                  ),
                  Text(counter.toString())
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
