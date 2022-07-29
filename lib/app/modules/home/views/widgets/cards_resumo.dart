import 'package:az_proof/app/modules/home/controllers/home_controller.dart';
import 'package:az_proof/app/modules/home/views/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardsResumo extends StatelessWidget {
  CardsResumo({Key? key}) : super(key: key);
  HomeController controller = Get.find<HomeController>();

  Future<bool> getData() async {
    late bool loading;
    await Future.delayed(const Duration(seconds: 5), () {
      loading = true;
    });
    return loading;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (c, s) {
        if (s.hasData) {
          return PrincipalCards(controller: controller);
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _shimmer(),
                const SizedBox(width: 10),
                _shimmer(),
              ],
            ),
          );
        }
      },
    );
  }

  Shimmer _shimmer() {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 120,
          width: 180,
          color: Colors.grey.shade300,
        ));
  }
}

class PrincipalCards extends StatelessWidget {
  const PrincipalCards({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardItem(
            color: Color(0xFFF4C8E1),
            icon: SvgPicture.asset('assets/icons/pedidos.svg'),
            amountType: "${controller.dataModel.value.ordersCount ?? ''}",
            type: 'Pedidos',
            amount: '${controller.dataModel.value.ordersTotal ?? 0}',
          ),
          CardItem(
            color: Color(0xFFB6EEDD),
            icon: SvgPicture.asset('assets/icons/vendas.svg'),
            amountType: "${controller.dataModel.value.salesCount ?? ''}",
            type: 'Vendas',
            amount: '${controller.dataModel.value.salesTotal ?? 0}',
          ),
          CardItem(
            color: Color(0xFFC3E7F3),
            icon: SvgPicture.asset('assets/icons/calculo.svg'),
            amountType: '',
            type: 'Ticket médio',
            amount: '${controller.dataModel.value.averageTicket ?? 0}',
          )
        ],
      ),
    );
  }
}
