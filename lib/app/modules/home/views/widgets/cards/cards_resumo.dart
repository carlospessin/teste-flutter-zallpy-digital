import 'package:az_proof/app/modules/home/controllers/home_controller.dart';
import 'package:az_proof/app/modules/home/views/widgets/cards/card_item.dart';
import 'package:az_proof/app/modules/home/views/widgets/shimmer/shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardsResumo extends StatelessWidget {
  CardsResumo({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  Future<bool> getData() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (c, s) {
        if (s.hasData) {
          return PrincipalCards(controller: controller);
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ShimmerCard(),
                const SizedBox(width: 10),
                ShimmerCard(),
              ],
            ),
          );
        }
      },
    );
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
