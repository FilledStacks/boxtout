import 'package:customer/app/app.router.dart';
import 'package:customer/models/application_models.dart';
import 'package:customer/ui/startup/startup_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

StartUpViewModel _getModel() => StartUpViewModel();

void main() {
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterService());

    group('runStartupLogic -', () {
      test(
          'When called should check if we have a logged in user on UserService',
          () async {
        final userService = getAndRegisterUserService();
        var model = _getModel();
        await model.runStartupLogic();
        verify(userService.hasLoggedInUser);
      });

      test('When we have no logged in user, should navigate to the LoginView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterUserService(hasLoggedInUser: false);
        var model = _getModel();
        await model.runStartupLogic();
        verify(navigationService.replaceWith(Routes.loginView));
      });

      test(
          'When hasLoggedInUser is true, should call syncUserAccount on the userService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        var model = _getModel();
        await model.runStartupLogic();
        verify(userService.syncUserAccount());
      });

      test('When the user sync is complete we want to get the current user',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        var model = _getModel();
        await model.runStartupLogic();
        verify(userService.currentUser);
      });

      test(
          'When currentUser does not have an address, navigate to the AddressSelectionView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterUserService(hasLoggedInUser: true);
        var model = _getModel();
        await model.runStartupLogic();
        verify(navigationService.navigateTo(Routes.addressSelectionView));
      });

      test('When currentUser HAS an address, navigate to the HomeView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterUserService(
            hasLoggedInUser: true,
            currentUser: User(
              id: '123',
              defaultAddress: 'set_to_value',
            ));
        var model = _getModel();
        await model.runStartupLogic();
        verify(navigationService.navigateTo(Routes.homeView));
      });
    });
  });
}
