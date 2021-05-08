import 'package:flutter/material.dart';
import '../../../../../core/util/extensions.dart';

class CardBodyItem extends StatelessWidget {
  final String description;
  final double value;
  final DisplayType type;
  final int precision;
  const CardBodyItem({
    required this.description,
    required this.value,
    required this.type,
    this.precision = 3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Text(
          value.toDisplay(type, precision),
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
