import 'package:app_ban_giay/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBingdings extends Bindings{

  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}