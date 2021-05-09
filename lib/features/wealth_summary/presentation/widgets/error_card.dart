import 'package:flutter/material.dart';

import '../../../../theme.dart';

class ErrorCard extends StatelessWidget {
  final String message;
  const ErrorCard({
    required this.message,
    Key? key,
  }) : super(key: key);

  static final padding = const EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 20,
  );
  static final double cardHeigth = 200;

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
      ],
    );
  }
}
