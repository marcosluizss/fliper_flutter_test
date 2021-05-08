import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/bloc/wealth_summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../injection_container.dart';

class WealthSummaryPage extends StatelessWidget {
  const WealthSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  BlocProvider<WealthSummaryBloc> buildBody() {
    return BlocProvider(
      create: (_) => sl<WealthSummaryBloc>()..add(GetWealthSummaryForCard()),
      child: SafeArea(
        child: Container(
          child:
              Center(child: BlocBuilder<WealthSummaryBloc, WealthSummaryState>(
            builder: (context, state) {
              if (state is Empty || state is Loading) {
                return CardLoading();
              } else if (state is Loaded) {
                return SummaryCard(wealthSummary: state.wealthSummary);
              } else if (state is Error) {
                return Container();
              } else {
                return Container();
              }
            },
          )),
        ),
      ),
    );
  }
}

class CardLoading extends StatelessWidget {
  const CardLoading({
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
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              child: Container(
                color: Colors.white,
                height: 25,
                width: 150,
              ),
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            ),
            Center(
              child: Column(
                children: [
                  Shimmer.fromColors(
                    child: Container(
                      color: Colors.white,
                      height: 25,
                      width: 150,
                    ),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Shimmer.fromColors(
                    child: Container(
                      color: Colors.white,
                      height: 25,
                      width: 150,
                    ),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 25,
                    width: 150,
                  ),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                ),
                Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 25,
                    width: 70,
                  ),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 25,
                    width: 150,
                  ),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                ),
                Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 25,
                    width: 70,
                  ),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 25,
                    width: 150,
                  ),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                ),
                Shimmer.fromColors(
                  child: Container(
                    color: Colors.white,
                    height: 25,
                    width: 70,
                  ),
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
            SummaryCardHeader(),
            SummaryCardSpotligth(total: wealthSummary.total),
            SummaryBodyItem(
              description: "Rentabilidade/mês",
              value: wealthSummary.profitability,
            ),
            SummaryBodyItem(
              description: "CDI",
              value: wealthSummary.cdi,
            ),
            SummaryBodyItem(
              description: "Ganho/mês",
              value: wealthSummary.gain,
            ),
            SummaryCardFooter(hasHistory: wealthSummary.hasHistory),
          ],
        ),
      ),
    );
  }
}

class SummaryCardFooter extends StatelessWidget {
  final bool hasHistory;
  const SummaryCardFooter({
    this.hasHistory = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!hasHistory) {
      return Container();
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 15),
            child: Divider(
              height: 1,
              color: Color.fromRGBO(154, 163, 188, 1),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 32,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Color.fromRGBO(59, 92, 184, 1),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  side: BorderSide(
                    width: 1,
                    color: Color.fromRGBO(59, 92, 184, 1),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 6,
                  ),
                  shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
                  elevation: 3,
                ),
                onPressed: () {},
                child: Text(
                  "VER MAIS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.48,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }
}

class SummaryBodyItem extends StatelessWidget {
  final String description;
  final double value;
  const SummaryBodyItem({
    required this.description,
    required this.value,
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
          "$value",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}

class SummaryCardSpotligth extends StatelessWidget {
  final double total;
  const SummaryCardSpotligth({
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
            "R\$ $total",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}

class SummaryCardHeader extends StatelessWidget {
  const SummaryCardHeader({
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
