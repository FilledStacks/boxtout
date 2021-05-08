import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.logger.dart';
import 'package:customer/app/app.router.dart';
import 'package:customer/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:places_service/places_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _placesService = locator<PlacesService>();

  Future<void> runStartupLogic() async {
    _placesService.initialize(apiKey: env['GOOGLE_MAPS_API_KEY']!);

    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;
      log.v('User sync complete. User profile: $currentUser');

      if (!currentUser.hasAddress) {
        _navigationService.navigateTo(Routes.addressSelectionView);
      } else {
        // navigate to home view
      }
    } else {
      log.v('No user on disk, navigate to the LoginView');
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
