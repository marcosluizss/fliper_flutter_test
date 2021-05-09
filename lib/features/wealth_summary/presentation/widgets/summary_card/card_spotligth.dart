import 'package:flutter/material.dart';

import '../../../../../core/util/extensions.dart';

class CardSpotligth extends StatelessWidget {
  final double total;
  const CardSpotligth({
    required this.total,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Valor investido",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            total.toCurrencyDisplay(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
