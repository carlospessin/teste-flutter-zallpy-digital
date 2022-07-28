import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrincipalCards extends StatelessWidget {
  const PrincipalCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(
            child: const SizedBox(
              width: 200,
              height: 100,
              child: Text('card'),
            ),
          )
        ],
      ),
    );
  }
}
