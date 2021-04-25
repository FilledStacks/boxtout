import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.logger.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');

  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  String title = '';

  Future<void> runStartupLogic() async {
    // We want to ensure that the time we get "into the app" that we have a current user
    // if we don't then we navigate to the Auth view for safety. This will help avoid
    // any weird states.
    if (!_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ... ');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;
      log.v('User sync complete. User Profile: $currentUser');

      // We have 2 hard requirements for the app to be used
      // 1. Current user on disk (could be anonymous as well)
      // 2. User must have an address selected before they can interact with the app

      if (currentUser.hasAddress) {
        log.v('We\'re ready to go! User has all the details to use the app');
        // navigate to the home view
      } else {
        log.v('User still needs to select an address for delivery.');
        _navigationService.navigateTo(Routes.addressSelectionView);
      }
    } else {
      log.v('No user on disk, navigate to the login view');
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
