import 'package:flutter/material.dart';
import 'package:abc_flutter_example/page1.dart';
import 'package:abc_flutter_example/data.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Data1(),
      child: MaterialApp(
        routes: {
          'newP': (context) => Page1(),
        },
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Data1 obj = Provider.of<Data1>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
        actions: [
          ElevatedButton(
            onPressed: () {
              //
              obj.addFood();
              //
            },
            child: Text('add Food'),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: obj.foodstore.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 40),
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              'newP',
              arguments: obj.foodstore[i],
            ),
            child: GridTileBar(
              backgroundColor: Colors.amber,
              leading: Text(obj.foodstore[i].id.toString()),
              title: Text(obj.foodstore[i].name.toString()),
              trailing: IconButton(
                  icon: Icon(
                      obj.foodstore[i].fav
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red),
                  onPressed: () {
                    //
                    obj.swFav(i);
                  }),
            ),
          );
        },
      ),
    );
  }
}
