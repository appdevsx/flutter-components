import 'package:adChange/backend/local_storage/local_storage.dart';
import 'package:adChange/extensions/custom_extensions.dart';
import 'package:adChange/routes/routes.dart';

import '../../utils/basic_screen_imports.dart';

class OnboardController extends GetxController {
  get onGetStarted => _onGetStarted();

  _onGetStarted() {
    Routes.signInScreen.offAllNamed;
    LocalStorage.saveOnboardDoneOrNot(isOnBoardDone: true);
  }
}
