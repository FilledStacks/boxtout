import 'package:customer/api/firestore_api.dart';
import 'package:customer/app/app.locator.dart';
import 'package:customer/exceptions/firestore_api_exception.dart';
import 'package:customer/models/application_models.dart';
import 'package:customer/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/app/app.logger.dart';

class HomeViewModel extends FutureViewModel<List<Merchant>> {
  final log = getLogger('HomeViewModel');

  final _fireStoreApi = locator<FirestoreApi>();
  final _userService = locator<UserService>();

  Future<List<Merchant>> getMerchantsForRegion() async {
    try {
      log.i(
          "fetch merchints from firestore where user: ${_userService.currentUser}");

      final userAddresses = await _fireStoreApi
          .getAddressListForUser(_userService.currentUser.id);
      final regionId = _fireStoreApi.extractRegionIdFromUserAddresses(
          addresses: userAddresses,
          userDefaultAddressId: _userService.currentUser.defaultAddress!);

      final merchants = await _fireStoreApi.getMerchantsCollectionForRegion(
          regionId: regionId);

      log.v('List of merchants: ${merchants.toString()}');
      return merchants;
    } on FirestoreApiException catch (error) {
      log.e(error.toString());
      throw Exception('An error happened while fetching merchints');
    }
  }

  @override
  Future<List<Merchant>> futureToRun() => getMerchantsForRegion();
}
