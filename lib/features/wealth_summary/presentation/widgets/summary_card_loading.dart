import 'widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SummaryCardLoading extends StatelessWidget
    implements WealthSummaryPageCard {
  const SummaryCardLoading({
    Key? key,
  }) : super(key: key);

  final _countBodyItems = 3;

  EdgeInsets get cardPadding => const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      );
  double get cardHeight => 250;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getCardItems(),
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
    for (var i = 0; i < _countBodyItems; i++) {
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
