import 'package:customer/app/app.locator.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final NavigationService? navigationService = locator<NavigationService>();

  final firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future saveData() async {
    final result = await runBusyFuture(runAuthentication());
    _handleAuthenticationResponse(result);
  }

  Future<void> useGoogleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithGoogle();
    _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithApple();
    _handleAuthenticationResponse(result);
  }

  /// Checks if the result has an error. If it doesn't we navigate to the success view
  /// else we show the friendly validation message.
  void _handleAuthenticationResponse(FirebaseAuthenticationResult authResult) {
    if (!authResult.hasError) {
      // navigate to success route
      navigationService!.replaceWith(successRoute);
    } else {
      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
