import 'package:adChange/widgets/common/others/custom_image_widget.dart';

import '../../../custom_assets/assets.gen.dart';
import '../../../utils/basic_screen_imports.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: CustomImageWidget(path: Assets.icon.back).paddingOnly(
        left: Dimensions.marginSizeHorizontal,
      ),
    );
  }
}
