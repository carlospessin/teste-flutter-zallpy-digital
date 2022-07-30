import 'package:az_proof/app/data/providers/data_provider.dart';
import 'package:az_proof/app/modules/home/controllers/home_controller.dart';
import 'package:az_proof/app/modules/home/views/widgets/cards/cards_resumo.dart';
import 'package:az_proof/app/modules/home/views/widgets/table/table_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';


class HomeView extends GetView<HomeController> {
  final controller = Get.find<HomeController>();

  void dependencies() {
    DataProvider sessionProvider = DataProvider();
    Get.lazyPut<HomeController>(() => HomeController(sessionProvider));
  }

  @override
  Widget build(BuildContext context) {
    dependencies();
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 2,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: (kToolbarHeight * 1.1),
              height: (kToolbarHeight * 1.1),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/reduzido.svg',
                  clipBehavior: Clip.antiAlias,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                  textColor: Color(0xFF8F95B2),
                  iconColor: Color(0xFF8F95B2),
                  selected: true,
                  selectedColor: Colors.white,
                  selectedTileColor: Color(0xFFFE7C6E),
                  horizontalTitleGap: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color(0xFFF5F5F5),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    'assets/images/home.svg',
                    color: Colors.white,
                  ),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  onTap: () => Get.offAndToNamed(Routes.HOME)),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFFFE7C6E)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Olá,',
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff59666F),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.userName.value.split(' ').first,
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          color: Color(0xff59666F),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFE7C6E),
                  ),
                  child: Center(
                    child: Icon(
                      FeatherIcons.user,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeView()), // this mainpage is your page to refresh
            (Route<dynamic> route) => false,
          );
        },
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 25,
                                    horizontal: 40,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Resumo da atividade',
                                          style: TextStyle(fontSize: 16)),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: CardsResumo(
                                            controller: controller,
                                          )),
                                      Text('Pedidos',
                                          style: TextStyle(fontSize: 16)),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: TableData()),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Color(0xffF5F5F5),
                                  height: 58,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 21),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/logo_azape.svg',
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        '® Desenvolvido por Pessin',
                                        style: TextStyle(
                                          fontFamily: 'NunitoSans',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFF97A1A8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
