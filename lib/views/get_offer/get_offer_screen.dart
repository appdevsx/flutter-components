import 'package:adChange/backend/local_storage/local_storage.dart';
import 'package:adChange/backend/utils/custom_loading_api.dart';
import 'package:adChange/controller/offer_buy/offer_buy_preview_controller.dart';
import 'package:adChange/extensions/custom_extensions.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import '../../backend/model/offer/get_offer_model.dart';
import '../../backend/services/api_endpoint.dart';
import '../../controller/get_offer/get_offer_controller.dart';
import '../../controller/make_counter_offer/make_counter_offer_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/animations/custom_listview_animation.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';
part '../get_offer/get_offer_mobile_screen_layout.dart';
part '../../widgets/get_offer/get_offer_widget.dart';

class GetOfferScreen extends StatelessWidget {
  GetOfferScreen({Key? key}) : super(key: key);
  final controller = Get.put(GetOfferController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: GetOfferMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
