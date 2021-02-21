import 'package:stacked/stacked.dart';

// "BUSINESS LOGIC" AND VIEW STATE

class SecondViewModel extends BaseViewModel {
  String title = '';

  void doSomething() {
    title += "new updated ";
    notifyListeners();
  }
}
