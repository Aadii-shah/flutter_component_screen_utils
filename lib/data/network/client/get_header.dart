import 'package:finnoto_app/employeePortal/presentation/core/helper/msc/all_imports.dart';

Future<Map<String, String>> getHeader({
  bool requiresAuthorization = true,
}) async {
  String? token;
  //token = await SharedPreferencesHelper.getAccessToken();
  token = await SharedPreferencesHelper.getValidatedToken();
  String platformType = Platform.isAndroid ? '1' : '2';

  return {
    "Content-Type": "application/json",
    'U-Platform-Id': platformType,
    'Accept': 'application/json, text/plain, */*',
    if (token != null && requiresAuthorization) "Authorization": "Bearer $token",
  };
}
