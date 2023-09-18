import 'package:adChange/views/auth/sign_in/sign_in_screen.dart';
import 'package:get/get.dart';

import '../bindings/initial.dart';
import '../views/auth/sign_in/otp_verification_screen.dart';
import '../views/auth/sign_in/reset_password_screen.dart';
import '../views/auth/sign_in/two_fa_verification_screen.dart';
import '../views/auth/sign_up/email_verification_screen.dart';
import '../views/auth/sign_up/sign_up_screen.dart';

part '../routes/route_pages.dart';

class Routes {
  // Page List
  static var list = RoutePageList.list;

  // Route Names
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onboard_screen';
  static const String signInScreen = '/sign_in_screen';
  static const String twoFaOtpVerificationScreen =
      '/twoFaOtpVerificationScreen';
  static const String otpVerificationScreen = '/otp_verification_screen';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String emailVerificationScreen = '/email_verification_screen';
  static const String confirmationScreen = '/confirmation_screen';
  static const String profileScreen = '/profile_screen';
  static const String navigationScreen = '/navigationScreen';
  static const String marketplaceBuyingPreviewScreen =
      '/marketplaceBuyingPreviewScreen';
  static const String sellingPreviewScreen = '/sellingPreviewScreen';
  static const String updateProfileScreen = '/updateProfileScreen';
  static const String feeCalculatorScreen = '/feeCalculatorScreen';
  static const String getOfferScreen = '/getOfferScreen';
  static const String mySectionHistoryScreen = '/mySectionHistoryScreen';
  static const String transactionScreen = '/transactionScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String twoFaVerificationScreen = '/twoFaVerificationScreen';
  static const String historyScreen = '/historyScreen';
  static const String makeAnOfferBuyingPreviewScreen =
      '/makeAnOfferBuyingPreviewScreen';
  static const String makeCounterOfferScreen = '/makeCounterOfferScreen';
  static const String myWalletScreen = '/myWalletScreen';
  static const String addMoneyScreen = '/addMoneyScreen';
  static const String addMoneyPreviewScreen = '/addMoneyPreviewScreen';
  static const String moneyOutScreen = '/moneyOutScreen';
  static const String moneyOutPreviewScreen = '/moneyOutPreviewScreen';
  static const String identityVerificationScreen =
      '/identityVerificationScreen';
  static const String adCreateSuccessfullyScreen =
      '/adCreateSuccessfullyScreen';
  static const String marketplaceEvidenceSubmitScreen =
      '/marketplaceEvidenceSubmitScreen';
  static const String filterItemsScreen = '/filterItemsScreen';

  //add money
  static const String paypalWebPaymentScreen = '/paypalWebPaymentScreen';
  static const String flutterWaveWebPaymentScreen =
      '/flutterWaveWebPaymentScreen';
  static const String addMoneyStripeAnimatedScreen =
      '/addMoneyStripeAnimatedScreen';
  static const String addMoneyManualPaymentScreen =
      '/addMoneyManualPaymentScreen';

  //Trade
  static const String tradeEditScreen = '/tradeEditScreen';

  /// offer
  static const String offerBuyPreviewScreen = '/offerBuyPreviewScreen';
  static const String offerEvidenceSubmitScreen = '/offerEvidenceSubmitScreen';
}
