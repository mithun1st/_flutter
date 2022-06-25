import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  //app bar variable
  AppBar AppBarVar1 = AppBar(
    title: const Text('LayouotBuilder'),
  );

  @override
  Widget build(BuildContext context) {
    //media query
    double screenHeight = MediaQuery.of(context).size.height;
    double statusHeight = MediaQuery.of(context).padding.top;
    double appHeight = AppBarVar1.preferredSize.height;
    double bodyHeight = screenHeight - (statusHeight + appHeight);

    return Scaffold(
      appBar: AppBarVar1,
      body: Column(
        children: [
          Container(
            height: bodyHeight * .7,
            width: double.infinity,
            color: Colors.greenAccent,
            //layout builder
            /*

              box1 (07/10){
                //list builder
                box(2/box1)
                box(5/box1)
                box(3/box1)
              }

              box2 (03/10){     
              }
            
             */
            child: LayoutBuilder(builder: (_, var1) {
              return Column(
                children: [
                  Container(
                    height: var1.maxHeight * .2,
                    width: 80,
                    color: Colors.red,
                  ),
                  Container(
                    height: var1.maxHeight * .5,
                    width: 20,
                    color: Colors.blue,
                  ),
                  Container(
                    height: var1.maxHeight * .3,
                    width: var1.maxWidth * .5,
                    color: Colors.green,
                  ),
                ],
              );
            }),
          ),
          Container(
            height: bodyHeight * .3,
            width: double.infinity,
            color: Colors.indigoAccent,
            alignment: Alignment.center,
            child: const Text('03/10'),
          ),
        ],
      ),
    );
  }
}
