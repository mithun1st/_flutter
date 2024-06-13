import 'package:flutter/material.dart';

class StateHeart extends StatefulWidget {
  const StateHeart({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateStateHeart();
  }
}

class _StateStateHeart extends State<StateHeart> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFav = !isFav;
          });
        },
        icon: Icon(
          Icons.favorite,
          color: isFav ? Colors.red : Colors.grey,
          size: isFav ? 30 : 24,
        ));
  }
}
