import 'package:adChange/backend/model/auth/sign_in_model.dart';
import 'package:adChange/controller/auth/sign_in/otp_verification_controller.dart';
import 'package:adChange/extensions/custom_extensions.dart';
import 'package:adChange/routes/routes.dart';
import 'package:adChange/utils/basic_screen_imports.dart';

import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/model/auth/forgot_password_model.dart';
import '../../../backend/services/api_services.dart';

class AuthState {
  SignInModel? signInModel;
  ForgotPasswordModel? forgotPasswordModel;
  String? errorMessage;

  AuthState({this.signInModel, this.forgotPasswordModel, this.errorMessage});
}

class AuthController extends GetxController with StateMixin<AuthState> {
  @override
  void onInit() {
    emailAddressController.text = 'user@appdevs.net';
    passwordController.text = 'appdevs';
    super.onInit();
  }

  /// set input field value
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotPasswordEmailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  /// set value for remember password
  RxBool isRemember = false.obs;

  /// set route & others process
  get onSignIn => signInProcess();
  get onForgotPassword => forgotPasswordProcess();
  get onSignUp => Routes.signUpScreen.toNamed;

  //! START API Implementation
  
  /// set loading process
  final isLoading = false.obs;
  final isForgotPasswordLoading = false.obs;

  ///* Sign in process
  Future<void> signInProcess() async {
    isLoading.value = true;
    change(null, status: RxStatus.loading());
    update();
    Map<String, dynamic> inputBody = {
      'email': emailAddressController.text,
      'password': passwordController.text,
    };

    try {
      final value = await ApiServices().signInProcessApi(body: inputBody);
      change(AuthState(signInModel: value), status: RxStatus.success());
      _saveDataLocalStorage();
      isLoading.value = false;
      update();
    } catch (e) {
      change(AuthState(errorMessage: e.toString()), status: RxStatus.error());
    }
  }

  _saveDataLocalStorage() {
    LocalStorage.saveIsSmsVerify(
        value: state!.signInModel!.data.user.smsVerified == 0 ? false : true);
    LocalStorage.saveTwoFaID(
        id: state!.signInModel!.data.user.twoFactorStatus == 0 ? false : true);
    LocalStorage.saveKyc(
        id: state!.signInModel!.data.user.kycVerified == 1 ? true : false);

    if (state!.signInModel!.data.user.twoFactorStatus == 1 &&
        state!.signInModel!.data.user.twoFactorVerified == 0) {
      LocalStorage.saveToken(token: state!.signInModel!.data.token);
      LocalStorage.saveEmail(email: state!.signInModel!.data.user.email);
      LocalStorage.saveId(id: state!.signInModel!.data.user.id);
      //  Get.toNamed(Routes.twoFaOtpVerificationScreen);
    } else if (state!.signInModel!.data.user.emailVerified == 1) {
      debugPrint("----------------VERIFIED");
      //  _goToSavedUser(signInModel);
    } else if (state!.signInModel!.data.user.emailVerified == 0) {
      debugPrint("----------------EMAIL NOT VERIFIED");
      LocalStorage.saveToken(token: state!.signInModel!.data.token);
      LocalStorage.saveId(id: state!.signInModel!.data.user.id);
      // Get.toNamed(Routes.emailVerificationScreen);
    }
  }

  void _goToSavedUser(SignInModel signInModel) {
    LocalStorage.saveToken(token: signInModel.data.token);
    if (isRemember.value) {
      LocalStorage.isLoginSuccess(isLoggedIn: true);
    }
    LocalStorage.saveEmail(email: signInModel.data.user.email);
    LocalStorage.saveId(id: signInModel.data.user.id);
    update();
    Get.offAllNamed(Routes.navigationScreen);
  }

  ///* Forgot Password Api Process
  Future<void> forgotPasswordProcess() async {
    isForgotPasswordLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'credentials': forgotPasswordEmailController.text.trim(),
    };

    try {
      final value =
          await ApiServices().forgotPasswordProcessApi(body: inputBody);
      change(AuthState(forgotPasswordModel: value), status: RxStatus.success());
      goToEmailVerification(state!.forgotPasswordModel!.data.user.token);
      isForgotPasswordLoading.value = false;
      update();
    } catch (e) {
      change(AuthState(errorMessage: e.toString()), status: RxStatus.error());
    }
  }

  final controller = Get.put(OtpVerificationController());
  void goToEmailVerification(String token) {
    Get.back();
    controller.userToken.value = token;
    debugPrint("\u001b[38;5;208____${controller.userToken.value}\u001b[0m____");
    Get.toNamed(Routes.otpVerificationScreen);
  }
}
