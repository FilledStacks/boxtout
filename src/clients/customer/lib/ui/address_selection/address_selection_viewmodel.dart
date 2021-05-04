import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.logger.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/models/application_models.dart';
import 'package:customer/services/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'address_selection_view.form.dart';

const NEW_ADDRESS = 'new-address';
const CURRENT_LOCATION = 'current-location';

class AddressSelectionViewModel extends FormViewModel {
  final _logger = getLogger('AddressSelectionViewModel');
  final _placesService = locator<PlacesService>();
  final _navigationService = locator<NavigationService>();
  final searchKey = 'search-key';
  final debounceId = 'places-service-get-results-id';

  String selection = '';
  List<PlacesAutoCompleteResult> results = [];
  PlacesAutoCompleteResult? selectedResult;

  bool get currentLocationSelected => selection == CURRENT_LOCATION;
  bool get enterNewAddressSelected => selection == NEW_ADDRESS;

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void close() {
    _navigationService.replaceWith(Routes.homeView);
  }

  void useCurrentLocation() {
    selection = CURRENT_LOCATION;
    notifyListeners();
  }

  void useNewAddress() {
    selection = NEW_ADDRESS;
    notifyListeners();
  }

  Future<void> search(String value) async {
    _logger.i(value);

    if (value.isEmpty) {
      return;
    }

    results = await runBusyFuture(
      _placesService.getAutoComplete(value),
      busyObject: searchKey,
      throwException: true,
    );
  }

  void onSelectResult(PlacesAutoCompleteResult result) {
    _logger.i(result.toJson());
    selectedResult = result;
    clearResults();
  }

  void clearResults() {
    results = [];
    notifyListeners();
  }
}
