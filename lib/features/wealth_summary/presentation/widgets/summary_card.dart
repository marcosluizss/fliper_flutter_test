import 'package:flutter/material.dart';

import '../../../../core/util/extensions.dart';
import '../../domain/entities/wealth_summary.dart';
import 'card_base.dart';
import 'summary_card/summary_card_widgets.dart';

class SummaryCard extends StatelessWidget implements WealthSummaryPageCard {
  final WealthSummary wealthSummary;
  const SummaryCard({
    required this.wealthSummary,
    Key? key,
  }) : super(key: key);

  EdgeInsets get cardPadding => const EdgeInsets.only(
        bottom: 14,
        right: 24,
        top: 25,
        left: 23.5,
      );
  double get cardHeight => 352;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardHeader(),
        CardSpotligth(total: wealthSummary.total),
        CardBodyItem(
          description: "Rentabilidade/mês",
          value: wealthSummary.profitability,
          type: DisplayType.PERCENT,
        ),
        CardBodyItem(
          description: "CDI",
          value: wealthSummary.cdi,
          type: DisplayType.PERCENT,
          precision: 2,
        ),
        CardBodyItem(
          description: "Ganho/mês",
          value: wealthSummary.gain,
          type: DisplayType.PRICE,
        ),
        CardFooter(hasHistory: wealthSummary.hasHistory),
      ],
    );
  }
}
