import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List l1 = ['one', 'two', 'three'];
  List l2 = ['apple', 'ball', 'cat'];
  List l3 = [2, 4, 5, 2, 1, 6, 2, 4, 3, 8, 7, 9];

  @override
  Widget build(BuildContext context) {
    //where (odd)
    List lt1 = l3.where(
      (element) {
        return element % 2 == 1;
      },
    ).toList();

    //any
    bool lt2 = l3.any(
      (element) {
        return element == 5;
      },
    );
    print(lt2);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mapping List'),
        ),
        body: Column(
          children: [
            //type 1
            ...l1.map((e) {
              return Text(e);
            }).toList(),

            //type 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: l2.map((e) {
                return Text('\t$e');
              }).toList(),
            ),

            //type 3
            Column(
              children: l1.map((e) => Text(e)).toList(),
            ),

            //where
            Row(
              children: lt1.map((e) => Text('$e ')).toList(),
            )
          ],
        ),
      ),
    );
  }
}
