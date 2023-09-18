import 'package:flutter/gestures.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../backend/utils/custom_snackbar.dart';
import '../../../controller/auth/sign_up/sign_up_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/common/app_basic_logo.dart';
import '../../../widgets/common/inputs/primary_input_widget.dart';
part '../sign_up/sign_up_mobile_screen_layout.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SignUpMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
