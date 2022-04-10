import 'package:customer/app/app.logger.dart';
import 'package:customer/constants/app_keys.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Returns values from the environment read from the .env file
class EnvironmentService {
  final log = getLogger('EnvironmentService');

  Future initialise() async {
    log.i('Load environment');
    await dotenv.load(fileName: ".env");
    log.v('Environement loaded');
  }

  /// Returns the value associated with the key
  String getValue(String key, {bool verbose = false}) {
    final value = dotenv.env[key] ?? NoKey;
    if (verbose) log.v('key:$key value:$value');
    return value;
  }
}
