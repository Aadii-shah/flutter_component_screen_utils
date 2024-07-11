import 'dart:io';

class AppConstants {
  static const String kKeyForIsCached = 'is_cached';

  static String getUserAgent() {
    return Platform.isAndroid ? '1' : '2';
  }
}
