import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  //pi section data
  List<PieChartSectionData> pcData = [
    PieChartSectionData(
      title: 'red',
      color: Colors.red,
      radius: 100,
      showTitle: false,
      value: 50,
      // titlePositionPercentageOffset: 0,
    ),
    PieChartSectionData(
      title: 'blue',
      color: Colors.green,
      radius: 100,
      showTitle: true,
      value: 20,
      titlePositionPercentageOffset: .80,
    ),
    PieChartSectionData(
        title: 'blue',
        color: Colors.blue,
        radius: 100 + 10,
        showTitle: true,
        value: 30,
        badgePositionPercentageOffset: .7,
        badgeWidget: const Icon(Icons.currency_bitcoin),
        borderSide: const BorderSide(
          width: 20,
          color: Colors.black,
        )
        // titlePositionPercentageOffset: 0.8,
        ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 10,
          width: 10,
          child: PieChart(
            PieChartData(
              sections: pcData,
              //
              centerSpaceRadius: 20,
              sectionsSpace: 5,
              startDegreeOffset: 45, //degree angle
              centerSpaceColor: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}
