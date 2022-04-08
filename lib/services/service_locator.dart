import 'package:get_it/get_it.dart';
import 'package:instant_messaging_flutter/services/api_service.dart';
import 'package:instant_messaging_flutter/services/feature_toggle_service.dart';
import 'package:instant_messaging_flutter/services/session_service.dart';

final getIt = GetIt.instance;

void _setupShared() {
  getIt.registerLazySingleton<SessionService>(() => SessionServiceImpl());
  getIt.registerLazySingleton<FeatureToggleService>(() => FeatureToggleSplitImpl());
}

void setupGetItB2C() {
  _setupShared();
  getIt.registerLazySingleton<ApiService>(() => B2CApiServiceImpl());
}

void setupGetItHero() {
  _setupShared();
  getIt.registerLazySingleton<ApiService>(() => HeroApiServiceImpl());
}