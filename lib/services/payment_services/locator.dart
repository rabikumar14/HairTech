import 'package:Beautech/services/payment_services/network_service.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get_it/get_it.dart';

const _cloudFunctionsRegion = 'europe-west2';

final locator = GetIt.instance;

void initializeLocator() {
  locator.registerLazySingleton(
      () => CloudFunctions(region: _cloudFunctionsRegion));
  locator.registerLazySingleton(() => NetworkService(locator.get()));
}
