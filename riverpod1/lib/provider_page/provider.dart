import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/provider_all.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});
  @override
  Widget build(BuildContext context,WidgetRef  ref) {
    final String msg = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: Text(msg),
    );
  }
}
