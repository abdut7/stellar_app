class ApiRoutes {
  static String baseUrl = "http://13.126.105.188:4100";
  static String socketBaseUrl = "http://13.126.105.188:4110";
  static String createUser = "/create_user";
  static String phoneNumberLogin = "/login_user";
  static String getStellarContacts = "/get_user";
  static String createContact = "/create_contact";
  static String getContacts = "/get_contact";
  static String createGroup = "/create_group";
  static String getChatHistory = "/get_chat_history";
  static String getPrivateMessage = "/get_messages";
  static String getUserById = "/get_user_by_id";
  static String getGroupDetails = "/get_group_details";
  static String getGroupMessage = "/get_messages";
  static String uploadBase64 = "/file_base64_upload";
  static String verifyOtp = "/otp_vrify";
  static String followUser = "/follow_user";
  static String unFollowUser = "/un_follow_user";
  static String blockUser = "/create_block_user";
  static String unBlockUser = "/unblock_user";
  static String getBlockedUserList = "/get_blocked_users";
  static String updateUser = "/update_user";
  static String chatHistorySearch = "/get_chat_history";
}
