import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/widgets/summary_card/summary_card_widgets.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/extensions.dart';

class SummaryCard extends StatelessWidget {
  final WealthSummary wealthSummary;
  const SummaryCard({
    required this.wealthSummary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      shadowColor: const Color.fromRGBO(154, 163, 188, 1),
      margin: const EdgeInsets.only(left: 16, right: 14.5),
      child: Container(
        height: 352,
        padding:
            const EdgeInsets.only(bottom: 14, right: 24, top: 25, left: 23.5),
        child: Column(
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
        ),
      ),
    );
  }
}
