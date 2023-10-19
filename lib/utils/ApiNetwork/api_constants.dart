class ApiConstants {
  /// dev
  static const String DEV_BASE_URL = "http://157.230.176.42/mining-app/api";
  static const String PROD_BASE_URL = "http://157.230.176.42/mining-app/api";
  static const String NODE_DEV_BASE_URL = "http://157.230.176.42:8080/api";
  static const String TOKEN = "OwXpYZCIFZSXN3bnr1mUJeToDTDl8sfSXX6Ozjj1SKtBO0pg79LolCXhW7l7";

  /// prod
  static const String BASE_URL = DEV_BASE_URL;
  static const String NODE_URL = NODE_DEV_BASE_URL;
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

  //Node Api

  static const String getMining = "$NODE_URL/mining/get-mining-history";
  static const String referralsHistory = "$NODE_URL/user/get-referrals-history";
  static const String addPlan = "$NODE_URL/plan/add";
  static const String withdrawPoint = "$NODE_URL/user/withdraw-point";
  static const String withdrawHistory = "$NODE_URL/user/get-withdraw-history";

  // new API
  static const String loginNEW = "$BASE_URL/login_v2";
  static const String forgotPassword = "$BASE_URL/forgot_password";
  static const String categoryNEW = "$BASE_URL/user_query_v2";
  static const String createQueryNew = "$BASE_URL/create_query_v2";
  static const String sendMessageNew = "$BASE_URL/query_message_v2";
  static const String changePassword = "$BASE_URL/change_password";
  static const String logOUt = "$BASE_URL/logout";
  static const String getUserInfo = "$BASE_URL/user_info_v2";
  static const String userInfoEditV2 = "$BASE_URL/user_info_edit_v2";
}
