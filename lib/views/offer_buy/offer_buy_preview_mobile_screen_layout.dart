part of 'offer_buy_preview_screen.dart';

class OfferBuyPreviewMobileScreenLayout extends StatelessWidget {
  OfferBuyPreviewMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OfferBuyPreviewController controller;
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
        OfferGatewayWidget(controller: controller),
        OfferPaymentDetailsWidget(controller: controller),
        _confirmButtonWidget()
      ],
    );
  }

  _confirmButtonWidget() {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.isBuyConfirmLoading,
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
          Get.back();
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
            text: Strings.verified,
            color: Theme.of(context).primaryColor,
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
