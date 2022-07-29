import 'package:az_proof/app/data/providers/data_provider.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    DataProvider sessionProvider = DataProvider();
    Get.lazyPut<HomeController>(() => HomeController(sessionProvider));
  }
}
