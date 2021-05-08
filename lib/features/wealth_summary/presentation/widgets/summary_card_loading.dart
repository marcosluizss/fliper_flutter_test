import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../theme.dart';

class SummaryCardLoading extends StatelessWidget {
  const SummaryCardLoading({
    Key? key,
  }) : super(key: key);

  final countBodyItems = 3;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      shadowColor: COLOR_LIGTH_GRAY,
      margin: const EdgeInsets.only(left: 16, right: 14.5),
      child: Container(
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getCardItems(),
        ),
      ),
    );
  }

  Shimmer getShimmer({required double width}) {
    return Shimmer.fromColors(
      child: Container(
        color: Colors.white,
        height: 25.0,
        width: width,
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }

  List<Widget> getBodyItems() {
    List<Widget> items = [];
    for (var i = 0; i < countBodyItems; i++) {
      items.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getShimmer(width: 150),
          getShimmer(width: 70),
        ],
      ));
    }
    return items;
  }

  Widget getSpotligthShimmer() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          getShimmer(width: 100),
          SizedBox(
            height: 8,
          ),
          getShimmer(width: 150),
        ],
      ),
    );
  }

  List<Widget> getCardItems() {
    List<Widget> items = [];
    items.add(getShimmer(width: 150));
    items.add(getSpotligthShimmer());
    items.addAll(getBodyItems());
    return items;
  }
}
