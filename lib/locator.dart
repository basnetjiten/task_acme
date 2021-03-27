import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'core/patch_simple_rest_api.dart';

LyricAppLocator locator() => LyricAppLocator();

Logger logger() => LyricAppLocator().logger;


class LyricAppLocator implements Locator {
  LyricAppLocator._();

  factory LyricAppLocator() {
    Locator.instance ??= LyricAppLocator._();
    return Locator.instance;
  }

  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();

  @override
  Logger logger = ConsoleLogger(LogLevel.verbose);


  PatchSimpleRestApi api = PatchSimpleRestApi(
      baseUrl: 'https://api.lyrics.ovh/v1/'); // Points to Mockoon instance

  Repository repository = Repository();
}
