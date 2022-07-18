import 'package:flutter/material.dart';
import 'package:navigator/newPage.dart';
import 'package:navigator/constNewPage.dart';
import 'package:navigator/routePage.dart';
import 'package:navigator/inputPage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(), //alternative to call

      //navigator route

      //initialRoute: '/NewPage', //set as a home page
      routes: {
        // '/' symbol automatic call Widget cls as a home Page
        '/': (context) => HomePage(),

        //1st direction
        'toRoutePage': (_) {
          return RoutePage();
        },

        //2nd direction (for better example)
        '/NewPage': (_) {
          return NewPage();
        },

        //fetch data from page
        '/InputPage': (_) {
          return InputPage();
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //Pop Show Model Bottom Sheet
  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: double.infinity,
          child: IconButton(
            onPressed: () {
              print('drop bottom sheet');
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.file_download_sharp,
              size: 100,
              color: Colors.deepOrange,
            ),
          ),
        );
      },
    );
  }

  //1st page to 2nd page
  void newPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return NewPage();
        },
      ),
    );
  }

  //Delete the 1st page and goto 2nd page
  void deletePreviousPageNgoToNewPage() {
    print('fnc');
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return NewPage();
    }));
  }

  //data pass via constructor
  void newPageCon(String s) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return NewPageCon(title: s);
        },
      ),
    );
  }

  //route Page with data OR pushNamed('')
  void routePage(int n, double d, String s) {
    List<Object> temList = [n, d, s];

    Navigator.of(context).pushNamed(
      'toRoutePage',
      arguments: temList,
    );
  }

  //route page to new page()
  void routePage1() {
    Navigator.of(context).pushNamed('/NewPage');
  }

  //fetch data from page -this fnc call from  InputPage
  TextEditingController c1 = TextEditingController();
  void fetchDataPage() {
    Navigator.of(context).pop();
    print(c1.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              bottomSheet();
            },
            child: const Text('Bottom Sheet'),
          ),
          ElevatedButton(
            onPressed: () {
              newPage();
            },
            child: const Text('Navigate To New Page'),
          ),
          ElevatedButton(
            onPressed: () {
              deletePreviousPageNgoToNewPage();
            },
            child: const Text('Delete Parent Page And Navigate to New Page'),
          ),
          ElevatedButton(
            onPressed: () {
              newPageCon('Data Pass Successfully');
            },
            child: const Text('Passing Data to New Page via Constructor'),
          ),
          ElevatedButton(
            onPressed: () {
              routePage(10, 3.14, 'Hi There');
            },
            child: const Text('Passing Data to NewPage'),
          ),
          ElevatedButton(
            onPressed: () {
              routePage1();
            },
            child: const Text('Route Page of NewPage()'),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/InputPage',
                    arguments: {
                      'fnc1': fetchDataPage,
                      'con1': c1,
                    },
                  );
                },
                child: const Text('Fetching data from NewPage'),
              ),
              Text(c1.text),
            ],
          ),
        ],
      ),
    );
  }
}
