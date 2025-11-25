class AppRoutes {
  //APP ROOT PAGES PROTECTED
  static const home = "/";

  // AUTH PAGES
  static const login = "/login";
  static const registration = "/registration";
  static const idConfirmation = "/id-confirmation";
  static const selfieVerification = "/selfie-verification";
  static const selfieVerificationSuccess = "/success-verification";

  // APP PROTECTED PAGES
  static const transactions = "/transactions";
  static const transactionsDetails = "/transactions/:id";

  static const scan = "/scan";
  static const wallet = "/wallet";
  static const profile = "/profile";

  static const account = "/account";
  static const settings = "/settings";
  static const help = "/help";
  static const termsAndConditions = "/terms-conditions";
  static const privacy = "/privacy-policy";
  static const support = "/support";
}
