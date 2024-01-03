import 'package:flutter/material.dart';
import 'package:get_it1/dep_inj..dart';
import 'package:get_it1/service/app_service.dart';
import 'package:get_it1/service/calculation.dart';
import 'package:get_it1/service/repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Get It")),
      body: Column(
        children: [
          const Text("Dependency Injection"),
          ElevatedButton(
            onPressed: () {
              final date = locator<AppService>().getToDaysDate();
              print(date);
            },
            child: const Text("to days date"),
          ), ElevatedButton(
            onPressed: () {
              final sum = locator<Calculation>().add(6, 4);
              print(sum);
            },
            child: const Text("add"),
          ),
          ElevatedButton(
            onPressed: () {
              final mul = locator<Calculation>().mul(10, 2);
              print(mul);
            },
            child: const Text("mul"),
          ),
          ElevatedButton(
            onPressed: () async {
              print("connecting...");
              final isOn = await locator<Repository>().initDB();
              print(isOn);
            },
            child: const Text("init db"),
          ),
          ElevatedButton(
            onPressed: () async {
              print("api call...");
              final isSucc = await locator<Repository>().apiCall();
              print(isSucc);
            },
            child: const Text("api call"),
          ),
        ],
      ),
    );
  }
}
