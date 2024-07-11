import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String userName = "user-name";
  static const String userEmail = "user-email";
  static const String userProfileImage = "user-profile-image";
  static const String userMobileMumber = "user-mobile-number";
  static const String accessToken = "access-token";
  static const String metaToken = "meta-token";
  static const String validatedToken = "validated-token";
  static const String businessToken = "business-token";
  static const String eAPIToken = "eapi-token";
  static const String raiseReimbursement = "raise-reimbursement";
  static const String raiseExpense = "raise-expense";
  static const String onlyReimbursement = "only-reimbursement";
  static const String userId = "user-id";
  static const String businessId = "business-id";
  static const String apiUrl = "api-url";
  static const String metaBusinessID = 'meta-business-id';

  static const String productID = 'product-id';
}

class SharedPreferencesHelper {
  static Future<void> saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> saveInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  //save userName
  static Future<void> saveUserName(String userName) async {
    await saveString(SharedPrefsKeys.userName, userName);
  }

  static Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.userName);
  }

  //save api_url of prod environment
  static Future<void> saveUserEmail(String userEmail) async {
    await saveString(SharedPrefsKeys.userEmail, userEmail);
  }

  static Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.userEmail);
  }

  //save api_url of prod environment
  static Future<void> saveUserProfileImage(String userProfileImage) async {
    await saveString(SharedPrefsKeys.userProfileImage, userProfileImage);
  }

  static Future<String?> getUserProfileImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.userProfileImage);
  }

  static Future<void> removeUserProfileImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(SharedPrefsKeys.userProfileImage);
  }

  static Future<void> saveUserMobileNumber(String userMobileNumber) async {
    await saveString(SharedPrefsKeys.userMobileMumber, userMobileNumber);
  }

  static Future<String?> getUserMobileNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.userMobileMumber);
  }

  static Future<void> removeUserMobileNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(SharedPrefsKeys.userMobileMumber);
  }

  //save api_url of prod environment
  static Future<void> saveApiUrl(String apiUrl) async {
    await saveString(SharedPrefsKeys.apiUrl, apiUrl);
  }

  static Future<String?> getApiUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.apiUrl);
  }

  //save api_url of prod environment
  static Future<void> saveProductID(String productId) async {
    await saveString(SharedPrefsKeys.productID, productId);
  }

  static Future<String?> getProductID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.productID);
  }

  //save userID
  static Future<void> saveUserID(String userID) async {
    await saveString(SharedPrefsKeys.userId, userID);
  }

  static Future<String?> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.userId);
  }

  //save businessID
  static Future<void> saveBusinessID(String businessID) async {
    await saveString(SharedPrefsKeys.businessId, businessID);
  }

  static Future<String?> getBusinessID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.businessId);
  }

  static Future<void> saveMetaBusinessID(String metaBusinessID) async {
    await saveString(SharedPrefsKeys.metaBusinessID, metaBusinessID);
  }

  static Future<String?> getMetaBusinessID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.metaBusinessID);
  }

  //save businessToken
  static Future<void> saveAccessToken(String accessToken) async {
    await saveString(SharedPrefsKeys.accessToken, accessToken);
  }

  static Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.accessToken);
  }

  //save businessToken
  static Future<void> saveBusinessToken(String businessToken) async {
    await saveString(SharedPrefsKeys.businessToken, businessToken);
  }

  static Future<String?> getBusinessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.businessToken);
  }

  //save user roles
  static Future<void> saveUserRoles(String? raiseReimbursement, String? raiseExpense, String? onlyReimbursement) async {
    await saveString(SharedPrefsKeys.raiseReimbursement, raiseReimbursement ?? '');
    await saveString(SharedPrefsKeys.raiseExpense, raiseExpense ?? '');
    await saveString(SharedPrefsKeys.onlyReimbursement, onlyReimbursement ?? '');
  }

  static Future<String?> getRaiseExpenseRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.raiseExpense);
  }

  static Future<String?> getRaiseReimbursement() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.raiseReimbursement);
  }

  static Future<String?> getRaiseOnlyReimbursement() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.onlyReimbursement);
  }

  static Future<void> saveValidatedToken(String validatedToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefsKeys.validatedToken, validatedToken);
  }

  static Future<String?> getValidatedToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPrefsKeys.validatedToken);
    return token;
  }

  // clear specific shared prefs
  static Future<void> removeSpecificSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(SharedPrefsKeys.userId);
    await prefs.remove(SharedPrefsKeys.businessId);
    await prefs.remove(SharedPrefsKeys.raiseExpense);
    await prefs.remove(SharedPrefsKeys.raiseReimbursement);
    await prefs.remove(SharedPrefsKeys.onlyReimbursement);
  }

  static const String userName = "user-name";
  static const String userEmail = "user-email";
  static const String userProfileImage = "user-profile-image";
  static const String userMobileMumber = "user-mobile-number";
  static const String accessToken = "access-token";
  static const String metaToken = "meta-token";
  static const String validatedToken = "validated-token";
  static const String businessToken = "business-token";
  static const String eAPIToken = "eapi-token";
  static const String raiseReimbursement = "raise-reimbursement";
  static const String raiseExpense = "raise-expense";
  static const String onlyReimbursement = "only-reimbursement";
  static const String userId = "user-id";
  static const String businessId = "business-id";
  static const String apiUrl = "api-url";

  // clear all shared prefs
  static Future<void> removeAllSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //self
    await prefs.remove(SharedPrefsKeys.userId);
    await prefs.remove(SharedPrefsKeys.userEmail);
    await prefs.remove(SharedPrefsKeys.userProfileImage);
    await prefs.remove(SharedPrefsKeys.userMobileMumber);
    await prefs.remove(SharedPrefsKeys.businessId);

    //roles
    await prefs.remove(SharedPrefsKeys.raiseExpense);
    await prefs.remove(SharedPrefsKeys.raiseReimbursement);
    await prefs.remove(SharedPrefsKeys.onlyReimbursement);

    //tokens
    await prefs.remove(SharedPrefsKeys.accessToken);
    await prefs.remove(SharedPrefsKeys.metaToken);
    await prefs.remove(SharedPrefsKeys.validatedToken);
    await prefs.remove(SharedPrefsKeys.businessToken);
    await prefs.remove(SharedPrefsKeys.eAPIToken);

    //urls
    await prefs.remove(SharedPrefsKeys.apiUrl);
  }
}
