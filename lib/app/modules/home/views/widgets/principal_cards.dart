import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrincipalCards extends StatelessWidget {
  const PrincipalCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardItem(
            color: Color(0xFFF4C8E1),
            icon: SvgPicture.asset('assets/icons/pedidos.svg'),
            amountType: '200',
            type: 'Pedidos',
            amount: '50.480,95',
          ),
          CardItem(
            color: Color(0xFFB6EEDD),
            icon: SvgPicture.asset('assets/icons/vendas.svg'),
            amountType: '156',
            type: 'Vendas',
            amount: '35.996,42',
          ),
          CardItem(
            color: Color(0xFFC3E7F3),
            icon: SvgPicture.asset('assets/icons/calculo.svg'),
            amountType: '',
            type: 'Ticket médio',
            amount: '230,74',
          )
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key? key,
      required this.color,
      required this.icon,
      required this.amountType,
      required this.type,
      required this.amount})
      : super(key: key);
  final Color color;
  final SvgPicture icon;
  final String amountType;
  final String type;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 180,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: icon,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: amountType != '' ? '$amountType ' : '',
                        children: <TextSpan>[
                          TextSpan(text: type),
                        ],
                      ),
                    ),
                    Text(
                      'R\$ $amount',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
