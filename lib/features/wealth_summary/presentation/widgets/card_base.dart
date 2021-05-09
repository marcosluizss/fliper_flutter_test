import 'package:flutter/material.dart';

import '../../../../theme.dart';

abstract class WealthSummaryPageCard {
  EdgeInsets get cardPadding;
  double get cardHeight;
}

class CardBase extends StatelessWidget {
  final WealthSummaryPageCard child;

  const CardBase({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 14.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: COLOR_LIGTH_GRAY,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      height: child.cardHeight,
      padding: child.cardPadding,
      child: child as Widget,
    );
  }
}
