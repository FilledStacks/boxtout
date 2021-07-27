import 'package:customer/api/firestore_api.dart';
import 'package:customer/app/app.locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _fireStoreApi = locator<FirestoreApi>();
  void onTap() async {
    final merchantes = await _fireStoreApi.getMerchantsCollectionForRegion(
        regionId: 'cape-town');
    print(merchantes);
  }
}
