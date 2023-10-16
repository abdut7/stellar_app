import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:stellar_chat/models/api_models/channel_model.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';
import 'package:stellar_chat/services/api_services/channel_service.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

class ProfileChannelController extends GetxController {
  int pageNumber = 0;
  final RxList<ChannelItem> channelItem = RxList();
  void loadMore({
    required String id,
    bool isProfile = false,
  }) {
    pageNumber++;
    ChannelService().getChannelsById(count: pageNumber, id: id);
  }
}
