part of 'money_out_preview_screen.dart';

class MoneyOutPreviewMobileScreenLayout extends StatelessWidget {
  MoneyOutPreviewMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MoneyOutPreviewController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
