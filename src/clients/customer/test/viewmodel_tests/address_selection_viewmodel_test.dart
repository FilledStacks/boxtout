import 'package:customer/app/app.router.dart';
import 'package:customer/constants/app_strings.dart';
import 'package:customer/models/application_models.dart';
import 'package:customer/services/user_service.dart';
import 'package:customer/ui/address_selection/address_selection_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';

AddressSelectionViewModel _getModel() => AddressSelectionViewModel();

void main() {
  group('AddressSelectionViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('selectAddressSuggestion -', () {
      test(
          'When called with AutoCompleteResult that has an id, should get place details using that id',
          () async {
        final placesService = getAndRegisterPlacesService();
        final model = _getModel();
        final placeIdInResult = 'id_to_us';
        await model.selectAddressSuggestion(
            autoCompleteResult:
                PlacesAutoCompleteResult(placeId: placeIdInResult));
        verify(placesService.getPlaceDetails(placeIdInResult));
      });

      test(
          'When called with AutoCompleteResult that has no id, should call dialog service to show dialog',
          () async {
        final dialogService = getAndRegisterDialogService();
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult());
        verify(dialogService.showDialog(
          title: InvalidAutoCompleteDialogTitle,
          description: InvalidAutoCompleteDialogDescription,
        ));
      });

      test(
          'When placesDetails retrieved, should call saveAddress on firestoreApi',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));
        verify(
          firestoreApi.saveAddress(
            address: anyNamed('address'),
            user: anyNamed('user'),
          ),
        );
      });

      test(
          'When placesDetails retrieved, should get userId from userService to get id',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));

        verify(userService.currentUser);
      });

      test(
          'When placesDetails returns all vales, should copy it over to the address',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final placeDetailsToReturn = PlacesDetails(
          city: 'Paarl',
          lat: 19,
          lng: 20,
          placeId: 'placeId',
          state: 'Western Cape',
          streetLong: 'Langen hofen Road',
          streetNumber: '78',
          streetShort: 'Langen hofen Rd',
          zip: '144',
        );

        getAndRegisterPlacesService(placesDetails: placeDetailsToReturn);
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));

        verify(firestoreApi.saveAddress(
          address: Address(
            placeId: 'placeId',
            lattitude: 19,
            longitute: 20,
            city: 'Paarl',
            postalCode: '144',
            state: 'Western Cape',
            street: 'Langen hofen Road',
          ),
          user: anyNamed('user'),
        ));
      });

      test(
          'When placesDetails returns no values, should use default values for non-required values',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final placeDetailsToReturn = PlacesDetails(
          placeId: 'placeId',
        );

        getAndRegisterPlacesService(placesDetails: placeDetailsToReturn);
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));

        verify(firestoreApi.saveAddress(
          address: Address(
            placeId: 'placeId',
            lattitude: -1,
            longitute: -1,
          ),
          user: anyNamed('user'),
        ));
      });

      test(
          'When saving address to firestore fails, should call show Dialog on DialogService',
          () async {
        final dialogService = getAndRegisterDialogService();
        getAndRegisterFirestoreApi(saveAddressSuccess: false);
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));
        verify(dialogService.showDialog(
          title: AddressSaveFailedDialogTitle,
          description: AddressSaveFailedDialogDescription,
        ));
      });

      test(
          'When saving address to firestore is successful, We should clear stack and navigate to the HomeView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterFirestoreApi(saveAddressSuccess: true);
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResult: PlacesAutoCompleteResult(placeId: 'id'));
        verify(navigationService.clearStackAndShow(Routes.homeView));
      });
    });
  });
}
