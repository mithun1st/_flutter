import 'package:flutter/material.dart';

class AnimationHeart extends StatefulWidget {
  const AnimationHeart({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateAnimationHeart();
  }
}

class _StateAnimationHeart extends State<AnimationHeart> with TickerProviderStateMixin {
  bool isFav = false;

  late AnimationController _animationController;

  late Animation _colorAnimation;
  late Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(_animationController);
    _sizeAnimation = Tween(begin: 24.0, end: 30.0).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isFav = !isFav;
        if (isFav) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      icon: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value.toDouble(),
          );
        },
      ),
    );
  }
}
