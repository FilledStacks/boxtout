import 'package:customer/app/app.router.dart';
import 'package:customer/ui/startup/startup_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

StartUpViewModel _getModel() => StartUpViewModel();

// TODO: Write test to confirm we're initialised invironement service
// TODO: Write test to confirm we are initialising the places service
// TODO: Write test to confirm that we are getting the environemnt key from the EnvironmentService
// TODO: Write test to confirm that the key returned from the environment service is the one used to initialise

void main() {
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('runStartupLogic -', () {
      test(
          'When called should check if we have a logged in user on UserService',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();
        await model.runStartupLogic();
        verify(userService.hasLoggedInUser);
      });

      test('When we have no logged in user, should navigate to the login view',
          () async {
        final navigationService = getAndRegisterNavigationService();
        final model = _getModel();
        await model.runStartupLogic();

        verify(navigationService.replaceWith(Routes.loginView));
      });

      test(
          'When hasLoggedInUser is true, should call syncUserAccount on the userService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartupLogic();

        verify(userService.syncUserAccount());
      });

      test(
          'When hasLoggedInUser is true, should get currentUser from userService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartupLogic();

        verify(userService.currentUser);
      });

      test(
          'When currentUser does NOT have default address, navigate to addressSelectionView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartupLogic();

        verify(navigationService.navigateTo(Routes.addressSelectionView));
      });
    });
  });
}
