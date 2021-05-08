import 'package:flutter/material.dart';

import '../../../../theme.dart';

class ErrorCard extends StatelessWidget {
  final String message;
  const ErrorCard({
    required this.message,
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
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
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
        ),
      ),
    );
  }
}
