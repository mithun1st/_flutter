class AppService {
  Stream<double> fakeStream() async* {
    await Future.delayed(const Duration(seconds: 2));
    double count = 100;
    while (true) {
      await Future.delayed(const Duration(milliseconds: 200));
      count += .70;
      yield count;
    }
  }

  Future<int> fakeApi() async {
    await Future.delayed(const Duration(seconds: 3));
    return 200;
  }
}
