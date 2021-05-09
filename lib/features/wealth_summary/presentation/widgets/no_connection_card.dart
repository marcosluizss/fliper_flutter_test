import 'package:flutter/material.dart';

import '../../../../theme.dart';
import 'widgets.dart';

class NoConnectionCard extends StatelessWidget
    implements WealthSummaryPageCard {
  const NoConnectionCard({
    Key? key,
  }) : super(key: key);

  EdgeInsets get cardPadding => const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      );
  double get cardHeight => 200;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          color: COLOR_BLUE,
          size: 60,
        ),
        Text(
          "Sem conexão",
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          "Ops! Verifique sua conexão.",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
