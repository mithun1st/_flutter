import 'package:flutter/material.dart';
import 'package:chart/item.dart';

class Chart extends StatefulWidget {
  late List<Item> item;
  late double totalExpense = 0;
  Map<String, double>? weekCost = {
    'mon': 0,
    'tue': 0,
    'wed': 0,
    'thu': 0,
    'fri': 0,
    'sat': 0,
    'sun': 0,
  };

  void get sepDayCost {
    for (var element in item) {
      switch (element.dt!.weekday) {
        case 1:
          weekCost!['mon'] = element.price! + weekCost!['mon']!;
          break;
        case 2:
          weekCost!['tue'] = element.price! + weekCost!['tue']!;
          break;
        case 3:
          weekCost!['wed'] = element.price! + weekCost!['wed']!;
          break;
        case 4:
          weekCost!['thu'] = element.price! + weekCost!['thu']!;
          break;
        case 5:
          weekCost!['fri'] = element.price! + weekCost!['fri']!;
          break;
        case 6:
          weekCost!['sat'] = element.price! + weekCost!['sat']!;
          break;
        case 7:
          weekCost!['sun'] = element.price! + weekCost!['sun']!;
          break;
      }
    }
  }

  Chart(List<Item> i) {
    item = i;
    sepDayCost;

    //calculate total expense
    weekCost!.forEach((key, value) {
      totalExpense += value;
    });
  }

  @override
  State createState() {
    return ChartState();
  }
}

class ChartState extends State<Chart> {
  //function bar widget
  Widget Bar(double cost) {
    return Container(
      height: double.infinity,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: FractionallySizedBox(
        heightFactor: cost / widget.totalExpense,
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade100,
            height: 200,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.weekCost!.keys.map((e) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(e.toUpperCase()),
                      ),
                      Flexible(
                        flex: 5,
                        child: Bar(widget.weekCost![e]!),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text('${widget.weekCost![e.toString()]}'),
                      ),
                    ],
                  );
                }).toList()),
          ),
          Text('Total Expense: ${widget.totalExpense}'),
        ],
      ),
    );
  }
}
