import 'package:adChange/controller/money_out/money_out_controller.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

part 'money_out_mobile_screen_layout.dart';

class MoneyOutScreen extends StatelessWidget {
  MoneyOutScreen({Key? key}) : super(key: key);

  final controller = Get.put(MoneyOutController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MoneyOuMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
