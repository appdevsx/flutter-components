part of '../profile/profile_screen.dart';

class ProfileMobileScreenLayout extends StatelessWidget {
  ProfileMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.profile),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ProfileInfoWidget(controller: controller),
        ProfileTopicWidget(controller: controller)
      ],
    );
  }
}