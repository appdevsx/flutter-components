import 'package:get/get.dart';

import '../controller/auth/sign_in/sign_in_controller.dart';

class SignInBin extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
