import 'package:adChange/controller/add_money/add_money_controller.dart';
import 'package:adChange/extensions/custom_extensions.dart';
import 'package:adChange/utils/basic_screen_imports.dart';
import 'package:adChange/widgets/common/others/custom_image_widget.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';

class PaypalWebPaymentScreen extends StatelessWidget {
  PaypalWebPaymentScreen({super.key});

  final controller = Get.put(AddMoneyController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.navigationScreen);
        return false;
      },
      child: Scaffold(
        appBar: PrimaryAppBar(
          Strings.paypalPayment,
          showBackButton: false,
          action: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                Routes.navigationScreen.offAllNamed;
              },
              child: CustomImageWidget(
                path: Assets.icon.homeIcon,
                color: Get.isDarkMode
                    ? CustomColor.whiteColor
                    : CustomColor.blackColor,
              ).paddingOnly(right: Dimensions.paddingSize),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Obx(
          () => controller.isConfirmLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var paymentUrl = '';
    final data = controller.addMoneyInsertPaypalModel.data.url;
    for (int i = 0; i < data.length; i++) {
      if (data[i].rel.contains('approve')) {
        paymentUrl = data[i].href;
      }
    }
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
      onWebViewCreated: (InAppWebViewController controller) {},
      onProgressChanged: (InAppWebViewController controller, int progress) {},
    );
  }
}
