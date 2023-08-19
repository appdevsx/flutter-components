part of "my_wallet_screen.dart";

class MyWalletMobileScreenLayout extends StatelessWidget {
  final MyWalletController controller;

  final formKey = GlobalKey<FormState>();
  MyWalletMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.myWallet),
      body: Obx(
        () => controller.controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        MyWalletCurrencyWidget(controller: controller),
      ],
    );
  }
}
