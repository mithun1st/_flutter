import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/app_service/app_service.dart';

class StateNotifierProviderState {
  int tem;
  bool loading;
  String srt;
  List<int> list;

  StateNotifierProviderState(this.tem, this.loading, this.srt, this.list);

  StateNotifierProviderState copyWith({
    int? tem1,
    bool? loading1,
    String? srt1,
    List<int>? list1,
  }) {
    return StateNotifierProviderState(
      tem1 ?? tem,
      loading1 ?? loading,
      srt1 ?? srt,
      list1 ?? list,
    );
  }
}

class StateNotifierProviderCtrl extends StateNotifier<StateNotifierProviderState> {
  final StateNotifierProviderRef ref;
  // StateNotifierProvider(this.)

  StateNotifierProviderCtrl(this.ref) : super(StateNotifierProviderState(0, true, "", [])) {
    getTem();
  }

  Future<void> getTem() async {
    state = state.copyWith(loading1: true);

    final int currentTem = await AppService().fakeApi();

    state = state.copyWith(loading1: false, tem1: currentTem);
  }

  void add(int n) {
    state = state.copyWith(list1: [...state.list, n]);
  }

  // void delete(int n) {
  //   //state.remove(n);
  // }
}
