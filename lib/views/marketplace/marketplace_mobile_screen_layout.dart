// ignore_for_file: prefer_const_constructors

part of '../marketplace/marketplace_screen.dart';

class MarketplaceMobileScreenLayout extends StatelessWidget {
  MarketplaceMobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MarketplaceController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        await controller.marketplaceInfoGetProcessApi();
      },
      child: AnimationLimiter(
        child: controller.marketplaceInfoModel.data.trads.data.isEmpty
            ? Center(
                child: InkWell(
                  onTap: () {
                    controller.marketplaceInfoGetProcessApi();
                  },
                  child: Column(
                    mainAxisAlignment: mainCenter,
                    children: [
                      const TitleHeading3Widget(text: Strings.noTradeFound),
                      verticalSpace(Dimensions.heightSize),
                      Icon(
                        Icons.replay_outlined,
                        color: CustomColor.blackColor,
                      )
                    ],
                  ),
                ),
              )
            : ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: List.generate(
                  controller.marketplaceInfoModel.data.trads.data.length,
                  (index) => CustomListViewAnimation(
                    index: index,
                    child: MarketplaceWidget(
                      data: controller
                          .marketplaceInfoModel.data.trads.data[index],
                      index: index,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
