import 'package:flutter/material.dart';
import 'package:riverpod1/provider_page/change_notifier_provider/change_notifier_provider_page.dart';
import 'package:riverpod1/provider_page/state_notified_listener/state_notifier_provider_page.dart';
import 'package:riverpod1/provider_page/provider.dart';
import 'package:riverpod1/provider_page/state_provider.dart';
import 'package:riverpod1/provider_page/stream_state_and_future_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProviderPage(),
                ),
              );
            },
            child: const Text("Provider Page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StateProviderPage(),
                ),
              );
            },
            child: const Text("StateProvider Page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StateProviderClearPage(),
                ),
              );
            },
            child: const Text("StateProvider Page\n(cache delete after going back)"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StateNotifierProviderPage(),
                ),
              );
            },
            child: const Text("StateNotifierProviderPage"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChangeNotifierProviderPage(),
                ),
              );
            },
            child: const Text("ChangeNotifierProviderPage"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StreamProviderAndStateProviderPage(),
                ),
              );
            },
            child: const Text("StreamProvider And StateProvider Page"),
          ),
        ],
      ),
    );
  }
}
