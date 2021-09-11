import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer {
  static Widget buildShimmerList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = 0; i < 10; i++) _buildShimmerItem(85),
        ],
      ),
    );
  }

  static Widget _buildShimmerItem(double height) {
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[300] ?? Colors.grey,
          highlightColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
            ),
          )),
    );
  }
}
