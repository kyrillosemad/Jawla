class AppLink {
  static const String server = "http://192.168.1.6/re7la";
///////////////////////////////////////////////////////////////////////////////
  static const String signUpApi = "$server/auth/signup.php";
  static const String loginApi = "$server/auth/login.php";
  static const String verifyCodeApi = "$server/auth/verifycode.php";
  static const String forgetPasswordCheckEmail =
      "$server/forgetpassword/checkemail.php";
  static const String forgetPasswordVerifyCode =
      "$server/forgetpassword/verifycode.php";
  static const String forgetPasswordResetPassword =
      "$server/forgetpassword/resetpassword.php";
  ///////////////////////////////////////////////////////////////////////////////
  static const String addTravelApi = "$server/travels/add_travel.php";
  static const String deleteTravelApi = "$server/travels/delete_travel.php";
  static const String viewAllTravelsApi =
      "$server/travels/view_all_travels.php";
  static const String viewBookedTravelsApi =
      "$server/travels/view_booked_travels.php";
  ////////////////////////////////////////////////////////////////////////////////
  static const String bookSeatApi = "$server/seats/book_seat.php";
  static const String cancelBookingApi = "$server/seats/cancel_booking.php";
  ////////////////////////////////////////////////////////////////////////////////
  static const String viewTickets = "$server/tickets/view_tickets.php";
}
