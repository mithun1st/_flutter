import 'package:flutter/material.dart';
import 'package:route/page_a.dart';
import 'package:route/page_b.dart';
import 'package:route/page_c.dart';
import 'package:route/page_d.dart';
import 'package:route/page_e.dart';
import 'package:route/page_f.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        PageB.routeName: (context) => PageB(),
        PageC.routeName: (context) => PageC(),
        PageD.routeName: (context) => PageD(),
        '/PageE': (context) => PageE(),
        PageF.routeName: (context) => PageF(),
      },
      //
      // onGenerateRoute: (rs) {
      //   print('-----------$rs');
      //   return MaterialPageRoute(builder: (_) {
      //     return PageE();
      //   });
      // },
      //unknownRoute (its call autometic when page not found)
      onUnknownRoute: (rs) {
        print('-----------$rs');
        return MaterialPageRoute(builder: (_) {
          return PageE();
        });
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //material page route
  void materialPageRoute() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return PageA();
        },
      ),
    );
  }

  String? popWithData = 'Pop Come With Data:';

  //route name
  void routeName() {
    Navigator.of(context).pushNamed(PageB.routeName);
  }

  //replace route
  void replaceRoute() {
    Navigator.of(context).pushReplacementNamed(PageD.routeName);
  }

  //route name with data
  void routeNameC() {
    String sentData = 'Mahadi Hassan Mithun';
    Navigator.of(context).pushNamed(
      PageC.routeName,
      arguments: sentData,
    );
  }

  //pop come with data
  void popComeWithData() {
    Navigator.of(context).pushNamed(PageF.routeName).then((value) {
      print(value);
      setState(() {
        popWithData = 'Pop Come With Data:' + value.toString();
      });
    });
  }

  //unknown Route E
  void unknownRouteE() {
    //Navigator.of(context).pushNamed('/pageD');  //sw1
    Navigator.of(context).pushNamed('/pageD xxx'); //sw2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route'),
      ),
      body: Column(
        children: [
          //--
          ElevatedButton(
            onPressed: () => setState(() {
              materialPageRoute();
            }),
            child: const Text('Material Route Page'),
          ),
          //--
          ElevatedButton(
            onPressed: () => setState(() {
              routeName();
            }),
            child: Text('Route Name'),
          ),
          //--
          ElevatedButton(
            onPressed: () => setState(() {
              replaceRoute();
            }),
            child: Text('Replace Route (ex: Login)'),
          ),
          //--
          ElevatedButton(
            onPressed: () => setState(() {
              routeNameC();
            }),
            child: Text('Route With Argument Data'),
          ),
          //--
          ElevatedButton(
            onPressed: () => setState(() {
              popComeWithData();
            }),
            child: Text(popWithData!),
          ),
          //--
          ElevatedButton(
            onPressed: () => setState(() {
              unknownRouteE();
            }),
            child: Text('Unknown Route'),
          ),
          //--
        ],
      ),
    );
  }
}
