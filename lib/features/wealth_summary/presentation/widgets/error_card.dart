import 'package:flutter/material.dart';

import '../../../../theme.dart';
import 'card_base.dart';

class ErrorCard extends StatelessWidget implements WealthSummaryPageCard {
  final String message;
  final Function onTapReload;
  const ErrorCard({
    required this.message,
    required this.onTapReload,
    Key? key,
  }) : super(key: key);

  EdgeInsets get cardPadding => const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      );
  double get cardHeight => 230;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: COLOR_BLUE,
          size: 60,
        ),
        Text(
          "Desculpe, algo deu errado.",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          child: Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.refresh),
                Text("Atualizar"),
              ],
            ),
          ),
          onPressed: () => onTapReload(),
        ),
      ],
    );
  }
}
