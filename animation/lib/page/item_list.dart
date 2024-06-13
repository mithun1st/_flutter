import 'package:animation/widget/animation_heart.dart';
import 'package:animation/widget/state_heart.dart';
import 'package:flutter/material.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget item(String name, Widget fav) {
      return Card(
        child: ListTile(
          title: Text(name),
          trailing: fav,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: Column(
        children: [
          item('item 1 (animation)', const AnimationHeart()),
          item('item 2 (setState)', const StateHeart()),
        ],
      ),
    );
  }
}
