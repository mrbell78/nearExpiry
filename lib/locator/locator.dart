import 'package:get_it/get_it.dart';
import 'package:near_expiry/http-service/http-service.dart';
import 'package:near_expiry/view/login/login-repository.dart';
import 'package:near_expiry/view/products/product-repository.dart';
import 'package:near_expiry/view/profile/profile-repository.dart';
import 'package:near_expiry/view/registration/registration-repository.dart';
import 'package:near_expiry/view/store/store-repository.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<StoreRepository>(() => StoreRepository());
  locator.registerLazySingleton<RegistrationRepository>(() => RegistrationRepository());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepository());
  locator.registerLazySingleton<ProductRepository>(() => ProductRepository());
  locator.registerLazySingleton<ProfileRepository>(() => ProfileRepository());

}