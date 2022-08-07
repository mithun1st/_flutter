import 'package:flutter/material.dart';

class SearchDelegate1 extends SearchDelegate {
  List<String> l;
  SearchDelegate1(this.l);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final tem = l
        .where(
          (element) => element.startsWith(query),
        )
        .toList();
    return ListView.builder(
      itemCount: tem.length,
      itemBuilder: (context, i) => ListTile(
        title: Card(
          color: Colors.blue,
          elevation: 10,
          child: ListTile(
            title: Text(tem[i]),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final tem = l
        .where(
          (element) => element.startsWith(query),
        )
        .toList();
    return ListView.builder(
        itemCount: tem.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              query = tem[index];
              showResults(context);
            },
            child: Card(
              elevation: 10,
              child: ListTile(
                title: Text(tem[index]),
                trailing: Icon(Icons.subdirectory_arrow_right_outlined),
              ),
            ),
          );
        });
  }
}
