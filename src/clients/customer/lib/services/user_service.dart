import 'package:customer/api/firestore_api.dart';
import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.logger.dart';
import 'package:customer/models/application_models.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

/// Provides all the functionality relating to the user logged in
class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  User? _currentUser;

  /// Returns the [User] account for the user currently logged in
  User get currentUser => _currentUser!;

  /// Returns true if this device has a user that is logged into the BoxtOut backend
  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  /// Syncs the user account if we have one, if we don't we create it
  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('user:$user');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Create a new user ...');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }

  /// Fetches the users account using the current logged in Users uid and saves it
  /// in memory.
  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }
}
