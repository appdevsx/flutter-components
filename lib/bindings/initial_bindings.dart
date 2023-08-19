import 'package:adChange/controller/currency/currency_controller.dart';

import '../controller/profile/update_profile_controller.dart';
import '../utils/basic_screen_imports.dart';

class InitialScreenBindings implements Bindings {
  String tag;

  InitialScreenBindings({required this.tag});

  @override
  void dependencies() {
    Get.lazyPut(() => UpdateProfileController(), tag: tag);
    Get.lazyPut(() => CurrencyController(), tag: tag);
  }
}
