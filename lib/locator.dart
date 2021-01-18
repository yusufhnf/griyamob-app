import 'package:get_it/get_it.dart';
import 'package:griyabayar/configs/navigation_service.dart';
import 'package:griyabayar/configs/push_notification_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton(() => NavigationService());
}
