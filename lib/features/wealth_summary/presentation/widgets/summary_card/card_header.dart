import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Seu resumo",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Icon(
          Icons.more_vert,
          color: Theme.of(context).iconTheme.color,
          size: Theme.of(context).iconTheme.size,
        ),
      ],
    );
  }
}
