import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../../theme.dart';
import '../bloc/wealth_summary_bloc.dart';
import '../widgets/widgets.dart';

class WealthSummaryPage extends StatefulWidget {
  @override
  _WealthSummaryPageState createState() => _WealthSummaryPageState();
}

class _WealthSummaryPageState extends State<WealthSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  double heigth = 0;
  EdgeInsets padding = EdgeInsets.zero;

  BlocProvider<WealthSummaryBloc> buildBody() {
    return BlocProvider(
      create: (_) => sl<WealthSummaryBloc>()..add(StartLoadPage()),
      child: SafeArea(
        child: Container(
          child: Center(
            child: BlocBuilder<WealthSummaryBloc, WealthSummaryState>(
              bloc: sl<WealthSummaryBloc>()..add(StartLoadPage()),
              builder: (context, state) {
                return _buildCard(state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(WealthSummaryState state) {
    late WealthSummaryPageCard _card;
    UniqueKey key = UniqueKey();
    if (state is Empty || state is Loading) {
      _card = SummaryCardLoading(
        key: key,
      );
    } else if (state is Loaded) {
      _card = SummaryCard(key: key, wealthSummary: state.wealthSummary);
    } else if (state is NotConnected) {
      _card = NoConnectionCard(
        key: key,
      );
    } else {
      String message = "Falha na montagem do card";
      if (state is Error) {
        message = state.message;
      }
      _card = ErrorCard(
        key: key,
        message: message,
        onTapReload: () {
          sl<WealthSummaryBloc>().add(GetWealthSummaryForCard());
        },
      );
    }

    return AnimatedContainer(
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.only(left: 16, right: 14.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: COLOR_LIGTH_GRAY,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      height: _card.cardHeight,
      padding: _card.cardPadding,
      child: AnimatedSwitcher(
        duration: Duration(microseconds: 500),
        child: _card as Widget,
      ),
    );
  }
}
