import 'package:flutter/material.dart';
import 'package:go_rouoter1/router_constant.dart';
import 'package:go_router/go_router.dart';

class PageB extends StatelessWidget {
  final double pi;
  final String srt;
  PageB({required this.pi, required this.srt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page B")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$pi \n $srt"),
          ElevatedButton(
              onPressed: () {
                context.pushReplacementNamed(RouterConstant.homePage);
              },
              child: const Text("go to main")),
        ],
      ),
    );
  }
}
