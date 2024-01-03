import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/app_service/app_service.dart';
import 'package:riverpod1/provider_page/change_notifier_provider/change_notifier_provider_controller.dart';
import 'package:riverpod1/provider_page/state_notified_listener/state_notifier_provider_controller.dart';

//#provider
final provider = Provider((ref) => "Hello World");

//#state provider
final stateProvider = StateProvider((ref) => -1);
//(data will delete if go back)
final stateProviderClear = StateProvider.autoDispose((ref) => -1);

//#state notifier provider
final stateNotifierProvider = StateNotifierProvider<StateNotifierProviderCtrl, StateNotifierProviderState>((ref) {
  return StateNotifierProviderCtrl(ref);
});

//#change notifier provider
final changeNotifierProvider = ChangeNotifierProvider<ChangeNotifierProviderCtrl>((ref) {
  return ChangeNotifierProviderCtrl();
});

//#stram provider
final streamProvider = StreamProvider((ref) => AppService().fakeStream());

//#future provider
final futureProvider = FutureProvider.autoDispose((ref) => AppService().fakeApi());
