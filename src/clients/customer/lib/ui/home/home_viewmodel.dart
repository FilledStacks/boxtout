import 'package:customer/api/firestore_api.dart';
import 'package:customer/app/app.locator.dart';
import 'package:customer/exceptions/firestore_api_exception.dart';
import 'package:customer/models/application_models.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/app/app.logger.dart';

class HomeViewModel extends FutureViewModel<List<Merchant>> {
  final log = getLogger('HomeViewModel');

  final _fireStoreApi = locator<FirestoreApi>();

  Future<List<Merchant>> getMerchantsForRegion() async {
    try {
      log.i("fetch merchints from firestore");

      final merchants = await _fireStoreApi.getMerchantsCollectionForRegion(
          regionId: 'cape-town');

      log.v('List of merchants: ${merchants.toString()}');
      return merchants;
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      throw Exception('An error happened while fetching merchints');
    }
  }

  @override
  Future<List<Merchant>> futureToRun() => getMerchantsForRegion();
}
