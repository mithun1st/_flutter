import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/provider_all.dart';

class ChangeNotifierProviderPage extends StatelessWidget {
  const ChangeNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("state notifier provider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final int value = ref.watch(changeNotifierProvider).value;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.read(changeNotifierProvider).add(2);
                        },
                        child: const Text("add"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(changeNotifierProvider).reset();
                        },
                        child: const Text("reset"),
                      ),
                    ],
                  ),
                  Text(value.toString()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
