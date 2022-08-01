class A extends B with C, D, E {
  String str;
  A(this.str) {
    print(str);
  }
}

//this class_B relation is Strong with the class_A
class B {
  void fncB() {
    print('class B');
  }
}

//this class_bellow relation is less strong with the class_A
class C {
  void fncC() {
    print('class C');
  }
}

mixin D {
  void fncMixIn1() {
    print('mixin 1');
  }
}

mixin E {
  void fncMixIn2() {
    print('mixin 2');
  }
}
