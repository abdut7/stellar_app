import 'package:get/get.dart';
import 'package:stellar_chat/models/api_models/flick_model.dart';
import 'package:stellar_chat/services/api_services/fliq_services.dart';

class FlicksPlayerController extends GetxController {
  int pageNumber = 0;
  final RxList<FlickItem> flickItems = RxList();
  void loadMore() {
    pageNumber++;
    FliqServices().getFlick(count: pageNumber);
  }
}
