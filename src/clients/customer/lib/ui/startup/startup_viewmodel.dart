import 'package:customer/app/app.locator.dart';
import 'package:customer/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// "BUSINESS LOGIC" AND VIEW STATE

class StartUpViewModel extends BaseViewModel {
  final _nagivationService = locator<NavigationService>();

  String title = '';

  void doSomething() {
    _nagivationService.navigateTo(Routes.secondView);
  }
}
