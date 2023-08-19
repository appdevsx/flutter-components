// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../history/history_screen.dart';

class HistoryMobileScreenLayout extends StatelessWidget {
  const HistoryMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final AddMoneyController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.history),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        controller.getAddMoneyInfoProcess();
      },
      child: AnimationLimiter(
        child: controller.addMoneyInfoModel.data.transactionss.isEmpty
            ? const Center(
                child: TitleHeading3Widget(text: Strings.noHistoryFound))
            : ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: List.generate(
                  controller.addMoneyInfoModel.data.transactionss.length,
                  (index) => CustomListViewAnimation(
                    index: index,
                    child: HistoryWidget(
                      data: controller
                          .addMoneyInfoModel.data.transactionss[index],
                    ),
                  ),
                ),
              ),
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }
}
