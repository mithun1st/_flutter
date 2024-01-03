import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/provider_all.dart';
import 'package:riverpod1/provider_page/state_notified_listener/state_notifier_provider_controller.dart';

class StateNotifierProviderPage extends StatelessWidget {
  const StateNotifierProviderPage({super.key});
  @override
  Widget build(BuildContext context) {
    print('build state notifier provider page');
    return Scaffold(
      appBar: AppBar(
        title: const Text("state notifier provider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final StateNotifierProviderState state = ref.watch(stateNotifierProvider);
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref.read(stateNotifierProvider.notifier).add(state.tem++);
                        },
                        child: const Text("add"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // ref.read(stateNotifierProvider).add(200);
                          ref.read(stateNotifierProvider.notifier).getTem();
                        },
                        child: const Text("refresh"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(stateNotifierProvider);
                        },
                        child: const Text("reset"),
                      ),
                    ],
                  ),
                  state.loading ? const Text("loading") : Text(state.tem.toString()),
                  Text(state.srt),
                  Text(state.list.toString()),
                ],
              );
            },
          ),
          //stream
          Consumer(
            builder: (context, ref, child) {
              final streamData = ref.watch(streamProvider);
              return streamData.when(
                data: (d) => Text(d.toString()),
                error: (e, _) => Text(e.toString()),
                loading: () => const Text('loading....'),
              );
            },
          ),
        ],
      ),
    );
  }
}
