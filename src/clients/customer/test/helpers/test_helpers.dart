import 'package:customer/api/firestore_api.dart';
import 'package:customer/app/app.locator.dart';
import 'package:customer/constants/app_keys.dart';
import 'package:customer/models/application_models.dart';
import 'package:customer/services/environment_service.dart';
import 'package:customer/services/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'test_helpers.mocks.dart';

// To find any test key we'll have to type TestKey and all these will pop up

const String UserIdTestKey = 'default_user';

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<PlacesService>(returnNullOnMissingStub: true),
  MockSpec<EnvironmentService>(returnNullOnMissingStub: true),
  MockSpec<DialogService>(returnNullOnMissingStub: true),
  MockSpec<FirestoreApi>(returnNullOnMissingStub: true),
])
MockUserService getAndRegisterUserService({
  bool hasLoggedInUser = false,
  User? currentUser,
}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  when(service.hasLoggedInUser).thenReturn(hasLoggedInUser);
  when(service.currentUser).thenReturn(currentUser ?? User(id: UserIdTestKey));
  locator.registerSingleton<UserService>(service);
  return service;
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockPlacesService getAndRegisterPlacesService({PlacesDetails? placesDetails}) {
  _removeRegistrationIfExists<PlacesService>();
  final service = MockPlacesService();

  when(service.getPlaceDetails(any))
      .thenAnswer((realInvocation) => Future<PlacesDetails>.value(
            placesDetails ??
                PlacesDetails(
                  placeId: 'TestId',
                  city: 'Test City',
                ),
          ));

  locator.registerSingleton<PlacesService>(service);
  return service;
}

MockEnvironmentService getAndRegisterEnvironmentService({
  String value = NoKey,
}) {
  _removeRegistrationIfExists<EnvironmentService>();
  final service = MockEnvironmentService();

  when(service.initialise()).thenAnswer((realInvocation) => Future.value());
  when(service.getValue(any)).thenReturn(value);

  locator.registerSingleton<EnvironmentService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();

  when(service.showDialog(
          barrierDismissible: anyNamed('barrierDismissible'),
          buttonTitle: anyNamed('buttonTitle'),
          buttonTitleColor: anyNamed('buttonTitleColor'),
          cancelTitle: anyNamed('cancelTitle'),
          cancelTitleColor: anyNamed('cancelTitleColor'),
          description: anyNamed('description'),
          dialogPlatform: anyNamed('dialogPlatform'),
          title: anyNamed('title')))
      .thenAnswer((realInvocation) => Future.value(DialogResponse()));

  locator.registerSingleton<DialogService>(service);
  return service;
}

MockFirestoreApi getAndRegisterFirestoreApi(
    {bool saveAddressSuccess = true,
    bool isCityServiced = true,
    List<Address>? userAdresses,
    String? regionId}) {
  _removeRegistrationIfExists<FirestoreApi>();
  final service = MockFirestoreApi();

  when(service.isCityServiced(city: anyNamed('city')))
      .thenAnswer((realInvocation) => Future.value(isCityServiced));
  when(service.getAddressListForUser(any))
      .thenAnswer((realInvocation) => Future.value(userAdresses ?? []));
  when(service.getMerchantsCollectionForRegion(regionId: anyNamed('regionId')))
      .thenAnswer((realInvocation) => Future.value([]));
  when(service.extractRegionIdFromUserAddresses(
          addresses: userAdresses ?? anyNamed('addresses'),
          userDefaultAddressId: anyNamed('userDefaultAddressId')))
      .thenReturn(regionId ?? 'RegionId');
  when(service.saveAddress(
    address: anyNamed('address'),
    user: anyNamed('user'),
  )).thenAnswer((realInvocation) => Future.value(saveAddressSuccess));

  locator.registerSingleton<FirestoreApi>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
  getAndRegisterPlacesService();
  getAndRegisterEnvironmentService();
  getAndRegisterDialogService();
  getAndRegisterFirestoreApi();
}

void unregisterServices() {
  locator.unregister<UserService>();
  locator.unregister<NavigationService>();
  locator.unregister<PlacesService>();
  locator.unregister<EnvironmentService>();
  locator.unregister<DialogService>();
  locator.unregister<FirestoreApi>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
