class ApiConstants {
  /// dev
  static const String DEV_BASE_URL = "http://157.230.176.42/mining-app/api";
  static const String PROD_BASE_URL = "http://157.230.176.42/mining-app/api";

  /// prod
  static const String BASE_URL = DEV_BASE_URL;
  static const int APP_ID = 7;

  /// Auth
  static const String signUp = "$BASE_URL/signup";
  static const String login = "$BASE_URL/login";
  static const String userInfo = "$BASE_URL/user_info";
  static const String userInfoEdit = "$BASE_URL/user_info_edit";
  static const String getReferUser = "$BASE_URL/get_refer_user";
  static const String getUser = "$BASE_URL/get_user";
  static const String appSetting = "$BASE_URL/app_setting";
  static const String withdrawal = "$BASE_URL/withdrawal";
  static const String payment = "$BASE_URL/payment";
  static const String mining = "$BASE_URL/mining";
  static const String plans = "$BASE_URL/plans";
  static const String referUser = "$BASE_URL/refer_user";
  static const String countries = "$BASE_URL/countries";
  static const String createQuery = "$BASE_URL/create_query";
  static const String userQuery = "$BASE_URL/user_query";
  static const String queryMessage = "$BASE_URL/query_message";
}
