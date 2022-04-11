import 'package:customer/models/application_models.dart';
import 'package:customer/ui/home/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

HomeViewModel _getModel() => HomeViewModel();

void main() {
  group('HomeViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('getMerchantsForRegion -', () {
      test('When called, should call getAddressListForUser from firestoreApi',
          () async {
        final userService = getAndRegisterUserService(
            currentUser: User(id: 'id', defaultAddress: 'i-am-here'));
        final firestoreApi = getAndRegisterFirestoreApi();

        final model = _getModel();
        await model.getMerchantsForRegion();
        final userId = userService.currentUser.id;
        verify(firestoreApi.getAddressListForUser(userId));
      });
      test(
          'When called, should call extractRegionIdFromUserAddresses using addresses from getAddressListForUser',
          () async {
        final userAdresses = [
          Address(
              id: 'i-am-here',
              placeId: 'placeId',
              city: 'cape-town',
              lattitude: 0,
              longitute: 0)
        ];
        final userService = getAndRegisterUserService(
            currentUser: User(id: 'id', defaultAddress: 'i-am-here'));
        final firestoreApi =
            getAndRegisterFirestoreApi(userAdresses: userAdresses);

        final model = _getModel();
        await model.getMerchantsForRegion();
        final userDefaultAddress = userService.currentUser.defaultAddress;

        verify(firestoreApi.extractRegionIdFromUserAddresses(
            addresses: userAdresses,
            userDefaultAddressId: userDefaultAddress!));
      });
      test(
          'When called, should call getMerchantsCollectionForRegion using addressRegionId from extractRegionIdFromUserAddresses',
          () async {
        const RegionId = 'id';
        getAndRegisterUserService(
            currentUser: User(id: 'id', defaultAddress: 'i-am-here'));
        final firestoreApi = getAndRegisterFirestoreApi(regionId: RegionId);

        final model = _getModel();
        await model.getMerchantsForRegion();
        verify(
            firestoreApi.getMerchantsCollectionForRegion(regionId: RegionId));
      });
    });
  });
}
