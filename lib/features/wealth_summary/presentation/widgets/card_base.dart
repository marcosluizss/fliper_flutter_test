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
      height: height,
      padding: padding,
      child: child,
    );
  }
}
