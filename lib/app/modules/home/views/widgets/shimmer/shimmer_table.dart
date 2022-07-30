import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTable extends StatelessWidget {
  const ShimmerTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 300,
          width: double.infinity,
          color: Colors.grey.shade300,
        ));
  }
}