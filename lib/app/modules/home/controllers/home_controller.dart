import 'package:az_proof/app/data/models/data_model.dart';
import 'package:az_proof/app/data/preferences/user_preferences.dart';
import 'package:az_proof/app/data/providers/data_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DataProvider dataProvider;
  HomeController(this.dataProvider);

  final user = UserPreferences().obs;
  final userName = ''.obs;
  final dataModel = DataModel().obs;

  @override
  void onInit() async {
    await getName();
    await getData(await user.value.getToken());
    super.onInit();
  }

  Future<void> getName() async {
    userName.value = await user.value.getName();
  }

  Future<void> getData(String token) async {
    try {
      dataModel.value = await dataProvider.getDataDashboard(token);
    } catch (e) {}
  }

}
