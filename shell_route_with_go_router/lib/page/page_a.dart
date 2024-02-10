import 'package:flutter/material.dart';
import 'package:go_rouoter1/router_constant.dart';
import 'package:go_router/go_router.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page A")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("pop"),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(RouterConstant.pageB);
            },
            child: const Text("text"),
          ),
        ],
      ),
    );
  }
}
