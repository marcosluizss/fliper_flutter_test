import 'package:flutter/material.dart';

import '../../../../theme.dart';

class CardBase extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double height;

  const CardBase({
    required this.child,
    required this.padding,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      shadowColor: COLOR_LIGTH_GRAY,
      margin: const EdgeInsets.only(left: 16, right: 14.5),
      child: Container(
        height: height,
        padding: padding,
        child: child,
      ),
    );
  }
}
