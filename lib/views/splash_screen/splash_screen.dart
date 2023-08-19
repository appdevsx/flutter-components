import 'package:adChange/backend/utils/custom_loading_api.dart';
import 'package:adChange/utils/basic_screen_imports.dart';
import 'package:adChange/utils/responsive_layout.dart';

import '../../controller/basic_settings/basic_settings_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.put(BasicSettingsController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Image.network(
      controller.splashImage.value,
      fit: BoxFit.cover,
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
    );
  }
}
