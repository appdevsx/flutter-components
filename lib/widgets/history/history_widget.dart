// ignore_for_file: prefer_const_constructors

part of '../../views/history/history_screen.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key, required this.data});
  final Transactionss data;
  @override
  Widget build(BuildContext context) {
    var day = DateFormat('dd');
    var month = DateFormat('MMM');
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.marginBetweenInputTitleAndBox * 0.5,
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.65),
      decoration: ShapeDecoration(
        color: Get.isDarkMode
            ? CustomColor.primaryBGDarkColor
            : CustomColor.primaryBGLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              TitleHeading1Widget(
                text: day.format(data.createdAt),
                fontWeight: FontWeight.w700,
              ),
              TitleHeading4Widget(
                text: month.format(data.createdAt),
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          Container(
            height: Dimensions.heightSize * 3,
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.45,
            ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.5,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: CustomColor.blackColor.withOpacity(0.20),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: crossStart,
            children: [
              Row(
                children: [
                  TitleHeading3Widget(text: data.transactionType),
                ],
              ),
              verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
              TitleHeading5Widget(
                text: data.trx,
                opacity: 0.30,
              )
            ],
          ),
          Spacer(),
          TitleHeading3Widget(
            text: data.requestAmount,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
