import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Clip Path')),
      backgroundColor: Colors.green,
      body: ClipPath(
        child: myWidget1(),
        clipper: MyClipPath1(),
      ),
    );
  }

  Widget myWidget1() {
    /*
    
    0   3

    1   2

    */
    return Container(
      height: 200,
      color: Colors.purple,
    );
  }
}

class MyClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double h = size.height;
    final double w = size.width;

    Path path = Path();
    path.lineTo(0, 0); //0 point
    path.lineTo(0, h); //1 point

    // path.lineTo(w, h); //2 point sw1

    path.quadraticBezierTo(w * .25, h * .5, w * .5, h); //1   1.25   1.5 point
    path.quadraticBezierTo(w * .95, h * .1, w, h); //1.5   1.75   2 point

    path.lineTo(w, 0); //3 point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
