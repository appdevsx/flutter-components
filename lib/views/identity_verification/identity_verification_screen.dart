import 'package:adChange/backend/utils/custom_loading_api.dart';

import '../../controller/identity_verification/identity_verification_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/kyc/kyc_status_widget.dart';
part 'identity_verification_mobile_screen_layout.dart';

class IdentityVerificationScreen extends StatelessWidget {
  IdentityVerificationScreen({Key? key}) : super(key: key);
  final controller = Get.put(IdentityVerificationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: IdentityVerificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
