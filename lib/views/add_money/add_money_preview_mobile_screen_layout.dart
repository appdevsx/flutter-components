part of 'add_money_preview_screen.dart';

class AddMoneyPreviewMobileScreenLayout extends StatelessWidget {
  const AddMoneyPreviewMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AddMoneyPreviewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.preview),
      body: Column(
        children: [
          CustomPreviewWidget(),
          _confirmButtonWidget(context),
        ],
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }

  _confirmButtonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.controller.isConfirmLoading,
        title: Strings.confirm,
        onPressed: () {
          controller.onConfirm;
        },
      ),
    );
  }
}
