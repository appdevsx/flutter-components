import 'package:adChange/backend/model/auth/sign_up_model.dart';
import 'package:adChange/backend/services/auth/auth_api_services.dart';
import 'package:adChange/routes/routes.dart';
import 'package:adChange/utils/basic_screen_imports.dart';

import 'package:adChange/extensions/custom_extensions.dart';

import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/services/api_services.dart';
import '../../../backend/utils/api_method.dart';

class SignUpController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool agreed = false.obs;

  get onSignUp => signUpProcessApi();
  get onSignIn => Routes.signInScreen.toNamed;

  /// >> set loading process & Sign Up Model
  final _isLoading = false.obs;
  late SignUpModel _signUpModel;

  /// >> get loading process & Sign Up Model
  bool get isLoading => _isLoading.value;
  SignUpModel get signUpModel => _signUpModel;

  ///* Sign Up Process Api
  Future<SignUpModel> signUpProcessApi() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailAddressController.text,
      'password': passwordController.text.trim(),
      'policy': 'on',
    };
    await  ApiServices().signUpProcessApi(body: inputBody).then((value) {
      _signUpModel = value!;
      _goToSavedUser(signUpModel);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signUpModel;
  }

  void _goToSavedUser(SignUpModel signUpModel) {
    LocalStorage.saveToken(token: signUpModel.data.token);
    LocalStorage.saveIsSmsVerify(
        value: signUpModel.data.user.smsVerified == 0 ? false : true);

    if (signUpModel.data.user.emailVerified == 0) {
      Get.offNamed(Routes.emailVerificationScreen);
    } else {
      LocalStorage.isLoginSuccess(isLoggedIn: true);
      LocalStorage.saveId(id: signUpModel.data.user.id);
      Get.offNamedUntil(Routes.navigationScreen, (route) => false);
    }
  }
}
