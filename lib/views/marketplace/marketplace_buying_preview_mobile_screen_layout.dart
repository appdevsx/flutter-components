part of '../marketplace/marketplace_buying_preview_screen.dart';

class MarketplaceBuyingPreviewMobileScreenLayout extends StatelessWidget {
  MarketplaceBuyingPreviewMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MarketplaceBuyingPreviewController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.75),
      physics: const BouncingScrollPhysics(),
      children: [
        MarketplaceGatewayWidget(controller: controller),
        MarketplacePaymentDetailsWidget(controller: controller),
        _confirmButtonWidget()
      ],
    );
  }

  _confirmButtonWidget() {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.isConfirmLoading,
        title: Strings.confirm,
        onPressed: () {
          controller.onConfirm;
        },
      ),
    );
  }

  _appBarWidget(BuildContext context) {
    return AppBar(
      leading: BackButtonWidget(
        onTap: () {
          // Get.back();
          Get.close(1);
        },
      ),
      title: Row(
        children: [
          TitleHeading2Widget(text: controller.sellerName.value),
          CircleAvatar(
            radius: Dimensions.radius * 0.4,
            backgroundColor: Get.isDarkMode
                ? CustomColor.whiteColor.withOpacity(0.30)
                : CustomColor.blackColor.withOpacity(0.30),
          ).paddingSymmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.2,
          ),
          TitleHeading4Widget(
            text: controller.isVerified.value
                ? Strings.verified
                : Strings.unVerified,
            color: controller.isVerified.value
                ? Theme.of(context).primaryColor
                : CustomColor.redColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}
