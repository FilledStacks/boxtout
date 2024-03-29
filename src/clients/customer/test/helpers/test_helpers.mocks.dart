// Mocks generated by Mockito 5.0.7 from annotations
// in customer/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:ui' as _i15;

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:customer/api/firestore_api.dart' as _i16;
import 'package:customer/models/application_models.dart' as _i2;
import 'package:customer/services/environment_service.dart' as _i12;
import 'package:customer/services/user_service.dart' as _i6;
import 'package:flutter/src/widgets/framework.dart' as _i9;
import 'package:flutter/src/widgets/navigator.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:places_service/src/models/application_models.dart' as _i3;
import 'package:places_service/src/places_service.dart' as _i11;
import 'package:stacked_services/src/dialog/dialog_service.dart' as _i13;
import 'package:stacked_services/src/models/overlay_request.dart' as _i14;
import 'package:stacked_services/src/models/overlay_response.dart' as _i4;
import 'package:stacked_services/src/navigation_service.dart' as _i8;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeUser extends _i1.Fake implements _i2.User {}

class _FakePlacesLocation extends _i1.Fake implements _i3.PlacesLocation {}

class _FakePlacesDetails extends _i1.Fake implements _i3.PlacesDetails {}

class _FakeDialogResponse extends _i1.Fake implements _i4.DialogResponse {}

class _FakeCollectionReference extends _i1.Fake
    implements _i5.CollectionReference {}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i6.UserService {
  @override
  _i2.User get currentUser =>
      (super.noSuchMethod(Invocation.getter(#currentUser),
          returnValue: _FakeUser()) as _i2.User);
  @override
  bool get hasLoggedInUser => (super
          .noSuchMethod(Invocation.getter(#hasLoggedInUser), returnValue: false)
      as bool);
  @override
  _i7.Future<void> syncUserAccount() =>
      (super.noSuchMethod(Invocation.method(#syncUserAccount, []),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> syncOrCreateUserAccount({_i2.User? user}) =>
      (super.noSuchMethod(
          Invocation.method(#syncOrCreateUserAccount, [], {#user: user}),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i8.NavigationService {
  @override
  String get previousRoute =>
      (super.noSuchMethod(Invocation.getter(#previousRoute), returnValue: '')
          as String);
  @override
  String get currentRoute =>
      (super.noSuchMethod(Invocation.getter(#currentRoute), returnValue: '')
          as String);
  @override
  _i9.GlobalKey<_i10.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(Invocation.method(#nestedNavigationKey, [index]))
          as _i9.GlobalKey<_i10.NavigatorState>?);
  @override
  void config(
          {bool? enableLog,
          bool? defaultPopGesture,
          bool? defaultOpaqueRoute,
          Duration? defaultDurationTransition,
          bool? defaultGlobalState,
          String? defaultTransition}) =>
      super.noSuchMethod(
          Invocation.method(#config, [], {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransition: defaultTransition
          }),
          returnValueForMissingStub: null);
  @override
  _i7.Future<dynamic>? navigateWithTransition(_i9.Widget? page,
          {bool? opaque,
          String? transition = r'',
          Duration? duration,
          bool? popGesture,
          int? id}) =>
      (super.noSuchMethod(Invocation.method(#navigateWithTransition, [
        page
      ], {
        #opaque: opaque,
        #transition: transition,
        #duration: duration,
        #popGesture: popGesture,
        #id: id
      })) as _i7.Future<dynamic>?);
  @override
  _i7.Future<dynamic>? replaceWithTransition(_i9.Widget? page,
          {bool? opaque,
          String? transition = r'',
          Duration? duration,
          bool? popGesture,
          int? id}) =>
      (super.noSuchMethod(Invocation.method(#replaceWithTransition, [
        page
      ], {
        #opaque: opaque,
        #transition: transition,
        #duration: duration,
        #popGesture: popGesture,
        #id: id
      })) as _i7.Future<dynamic>?);
  @override
  bool back({dynamic result, int? id}) => (super.noSuchMethod(
      Invocation.method(#back, [], {#result: result, #id: id}),
      returnValue: false) as bool);
  @override
  void popUntil(_i10.RoutePredicate? predicate) =>
      super.noSuchMethod(Invocation.method(#popUntil, [predicate]),
          returnValueForMissingStub: null);
  @override
  void popRepeated(int? popTimes) =>
      super.noSuchMethod(Invocation.method(#popRepeated, [popTimes]),
          returnValueForMissingStub: null);
  @override
  _i7.Future<dynamic>? navigateTo(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#navigateTo, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i7.Future<dynamic>?);
  @override
  _i7.Future<dynamic>? navigateToView(_i9.Widget? view,
          {dynamic arguments, int? id, bool? preventDuplicates = true}) =>
      (super.noSuchMethod(Invocation.method(#navigateToView, [
        view
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates
      })) as _i7.Future<dynamic>?);
  @override
  _i7.Future<dynamic>? replaceWith(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#replaceWith, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i7.Future<dynamic>?);
  @override
  _i7.Future<dynamic>? clearStackAndShow(String? routeName,
          {dynamic arguments, int? id, Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#clearStackAndShow, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #parameters: parameters
      })) as _i7.Future<dynamic>?);
  @override
  _i7.Future<dynamic>? clearTillFirstAndShow(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#clearTillFirstAndShow, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i7.Future<dynamic>?);
  @override
  _i7.Future<dynamic>? clearTillFirstAndShowView(_i9.Widget? view,
          {dynamic arguments, int? id}) =>
      (super.noSuchMethod(Invocation.method(#clearTillFirstAndShowView, [view],
          {#arguments: arguments, #id: id})) as _i7.Future<dynamic>?);
  @override
  _i7.Future<dynamic>? pushNamedAndRemoveUntil(String? routeName,
          {_i10.RoutePredicate? predicate, dynamic arguments, int? id}) =>
      (super.noSuchMethod(Invocation.method(#pushNamedAndRemoveUntil, [
        routeName
      ], {
        #predicate: predicate,
        #arguments: arguments,
        #id: id
      })) as _i7.Future<dynamic>?);
}

/// A class which mocks [PlacesService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlacesService extends _i1.Mock implements _i11.PlacesService {
  @override
  _i3.PlacesLocation get currentPosition =>
      (super.noSuchMethod(Invocation.getter(#currentPosition),
          returnValue: _FakePlacesLocation()) as _i3.PlacesLocation);
  @override
  void initialize({String? apiKey}) =>
      super.noSuchMethod(Invocation.method(#initialize, [], {#apiKey: apiKey}),
          returnValueForMissingStub: null);
  @override
  _i7.Future<List<_i3.PlacesAutoCompleteResult>> getAutoComplete(
          String? input) =>
      (super.noSuchMethod(Invocation.method(#getAutoComplete, [input]),
              returnValue: Future<List<_i3.PlacesAutoCompleteResult>>.value(
                  <_i3.PlacesAutoCompleteResult>[]))
          as _i7.Future<List<_i3.PlacesAutoCompleteResult>>);
  @override
  _i7.Future<_i3.PlacesDetails> getPlaceDetails(String? placeId) =>
      (super.noSuchMethod(Invocation.method(#getPlaceDetails, [placeId]),
              returnValue:
                  Future<_i3.PlacesDetails>.value(_FakePlacesDetails()))
          as _i7.Future<_i3.PlacesDetails>);
  @override
  _i7.Future<dynamic> getPlacesAtCurrentLocation() =>
      (super.noSuchMethod(Invocation.method(#getPlacesAtCurrentLocation, []),
          returnValue: Future<dynamic>.value(null)) as _i7.Future<dynamic>);
}

/// A class which mocks [EnvironmentService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEnvironmentService extends _i1.Mock
    implements _i12.EnvironmentService {
  @override
  _i7.Future<dynamic> initialise() =>
      (super.noSuchMethod(Invocation.method(#initialise, []),
          returnValue: Future<dynamic>.value(null)) as _i7.Future<dynamic>);
  @override
  String getValue(String? key, {bool? verbose = false}) => (super.noSuchMethod(
      Invocation.method(#getValue, [key], {#verbose: verbose}),
      returnValue: '') as String);
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i13.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i13.DialogBuilder>? builders) =>
      super.noSuchMethod(
          Invocation.method(#registerCustomDialogBuilders, [builders]),
          returnValueForMissingStub: null);
  @override
  void registerCustomDialogBuilder(
          {dynamic variant,
          _i9.Widget Function(_i9.BuildContext, _i14.DialogRequest,
                  dynamic Function(_i4.DialogResponse))?
              builder}) =>
      super.noSuchMethod(
          Invocation.method(#registerCustomDialogBuilder, [],
              {#variant: variant, #builder: builder}),
          returnValueForMissingStub: null);
  @override
  _i7.Future<_i4.DialogResponse?> showDialog(
          {String? title,
          String? description,
          String? cancelTitle,
          _i15.Color? cancelTitleColor,
          String? buttonTitle = r'Ok',
          _i15.Color? buttonTitleColor,
          bool? barrierDismissible = false,
          _i13.DialogPlatform? dialogPlatform}) =>
      (super.noSuchMethod(
              Invocation.method(#showDialog, [], {
                #title: title,
                #description: description,
                #cancelTitle: cancelTitle,
                #cancelTitleColor: cancelTitleColor,
                #buttonTitle: buttonTitle,
                #buttonTitleColor: buttonTitleColor,
                #barrierDismissible: barrierDismissible,
                #dialogPlatform: dialogPlatform
              }),
              returnValue:
                  Future<_i4.DialogResponse?>.value(_FakeDialogResponse()))
          as _i7.Future<_i4.DialogResponse?>);
  @override
  _i7.Future<_i4.DialogResponse?> showCustomDialog(
          {dynamic variant,
          String? title,
          String? description,
          bool? hasImage = false,
          String? imageUrl,
          bool? showIconInMainButton = false,
          String? mainButtonTitle,
          bool? showIconInSecondaryButton = false,
          String? secondaryButtonTitle,
          bool? showIconInAdditionalButton = false,
          String? additionalButtonTitle,
          bool? takesInput = false,
          _i15.Color? barrierColor = const _i15.Color(2315255808),
          bool? barrierDismissible = false,
          String? barrierLabel = r'',
          dynamic customData}) =>
      (super.noSuchMethod(
              Invocation.method(#showCustomDialog, [], {
                #variant: variant,
                #title: title,
                #description: description,
                #hasImage: hasImage,
                #imageUrl: imageUrl,
                #showIconInMainButton: showIconInMainButton,
                #mainButtonTitle: mainButtonTitle,
                #showIconInSecondaryButton: showIconInSecondaryButton,
                #secondaryButtonTitle: secondaryButtonTitle,
                #showIconInAdditionalButton: showIconInAdditionalButton,
                #additionalButtonTitle: additionalButtonTitle,
                #takesInput: takesInput,
                #barrierColor: barrierColor,
                #barrierDismissible: barrierDismissible,
                #barrierLabel: barrierLabel,
                #customData: customData
              }),
              returnValue:
                  Future<_i4.DialogResponse?>.value(_FakeDialogResponse()))
          as _i7.Future<_i4.DialogResponse?>);
  @override
  _i7.Future<_i4.DialogResponse?> showConfirmationDialog(
          {String? title,
          String? description,
          String? cancelTitle = r'Cancel',
          String? confirmationTitle = r'Ok',
          bool? barrierDismissible = false,
          _i13.DialogPlatform? dialogPlatform}) =>
      (super.noSuchMethod(
              Invocation.method(#showConfirmationDialog, [], {
                #title: title,
                #description: description,
                #cancelTitle: cancelTitle,
                #confirmationTitle: confirmationTitle,
                #barrierDismissible: barrierDismissible,
                #dialogPlatform: dialogPlatform
              }),
              returnValue:
                  Future<_i4.DialogResponse?>.value(_FakeDialogResponse()))
          as _i7.Future<_i4.DialogResponse?>);
  @override
  void completeDialog(_i4.DialogResponse? response) =>
      super.noSuchMethod(Invocation.method(#completeDialog, [response]),
          returnValueForMissingStub: null);
}

/// A class which mocks [FirestoreApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreApi extends _i1.Mock implements _i16.FirestoreApi {
  @override
  _i5.CollectionReference get usersCollection =>
      (super.noSuchMethod(Invocation.getter(#usersCollection),
          returnValue: _FakeCollectionReference()) as _i5.CollectionReference);
  @override
  _i7.Future<void> createUser({_i2.User? user}) =>
      (super.noSuchMethod(Invocation.method(#createUser, [], {#user: user}),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i2.User?> getUser({String? userId}) =>
      (super.noSuchMethod(Invocation.method(#getUser, [], {#userId: userId}),
              returnValue: Future<_i2.User?>.value(_FakeUser()))
          as _i7.Future<_i2.User?>);
  @override
  _i7.Future<bool> saveAddress({_i2.Address? address, _i2.User? user}) =>
      (super.noSuchMethod(
          Invocation.method(#saveAddress, [], {#address: address, #user: user}),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<bool> isCityServiced({String? city}) =>
      (super.noSuchMethod(Invocation.method(#isCityServiced, [], {#city: city}),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i5.CollectionReference getAddressCollectionForUser(String? userId) => (super
      .noSuchMethod(Invocation.method(#getAddressCollectionForUser, [userId]),
          returnValue: _FakeCollectionReference()) as _i5.CollectionReference);
}
