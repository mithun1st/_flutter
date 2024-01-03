import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/provider_all.dart';

class StreamProviderAndStateProviderPage extends StatelessWidget {
  const StreamProviderAndStateProviderPage({super.key});
  @override
  Widget build(BuildContext context) {
    print('#build stream and future provider page');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Provider And State Provider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //#stream provider
          Consumer(
            builder: (context, ref, child) {
              print('#build stream');
              final streamData = ref.watch(streamProvider);
              return streamData.when(
                data: (d) => Text(d.toString()),
                error: (e, _) => Text(e.toString()),
                loading: () => const Text('loading....'),
              );
            },
          ),
          //#future provider
          Consumer(
            builder: (context, ref, child) {
              print('#build future');
              final futureData = ref.watch(futureProvider);
              return futureData.when(
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
