import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';

class NetworkConstants {
  static String metaBaseUrl = dotenv.env['metaBaseUrl'] ?? '';
  static String metaAuthBaseUrl = dotenv.env['metaAuthBaseUrl'] ?? '';
  static String metaBusinessBaseUrl = dotenv.env['metaBusinessBaseUrl'] ?? '';
  static String eapiAuthBaseUrl = dotenv.env['eapiAuthBaseUrl'] ?? '';
  static String eapiBaseUrl = 'https://eapi.finnoto.dev/';
}
