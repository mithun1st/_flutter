import 'package:get_it/get_it.dart';
import 'package:get_it1/service/app_service.dart';
import 'package:get_it1/service/calculation.dart';
import 'package:get_it1/service/repository.dart';

final locator = GetIt.instance;

void setup() {

  //create instance with every call
  locator.registerFactory(() => AppService());

  //create instance once with runtime
  locator.registerSingleton<Calculation>(Calculation());
  
  //create instance once with first call
  locator.registerLazySingleton(() => Repository());
  
}
