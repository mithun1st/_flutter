import 'package:flutter/material.dart';
import 'package:go_rouoter1/router_constant.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
          
            context.pushNamed(RouterConstant.pageA);
          }, child: const Text("go to page A")),

          ElevatedButton(onPressed: () {
              final Map <String,dynamic> mp ={
              "p1": 3.1416.toString(),
              "p2": "hello World"
            };
            context.pushReplacementNamed(RouterConstant.pageB, queryParameters: mp);
          }, child: const Text("go to page B")),
        ],
      ),
    );
  }
}
