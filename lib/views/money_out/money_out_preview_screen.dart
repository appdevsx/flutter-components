import '../../controller/money_out/money_out_preview_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
part 'money_out_preview_mobile_screen_layout.dart';

class MoneyOutPreviewScreen extends StatelessWidget {
  MoneyOutPreviewScreen({Key? key}) : super(key: key);

  final controller = Get.put(MoneyOutPreviewController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MoneyOutPreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
