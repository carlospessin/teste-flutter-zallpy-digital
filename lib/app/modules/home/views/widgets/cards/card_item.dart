import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
