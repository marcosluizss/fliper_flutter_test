import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/wealth_summary_bloc.dart';
import '../widgets/widgets.dart';

class WealthSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  BlocProvider<WealthSummaryBloc> buildBody() {
    return BlocProvider(
      create: (_) => sl<WealthSummaryBloc>()..add(StartLoadPage()),
      child: SafeArea(
        child: Container(
          child: Center(
            child: BlocBuilder<WealthSummaryBloc, WealthSummaryState>(
              builder: (_, state) {
                return _buildCard(state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(WealthSummaryState state) {
    Widget _card = Container();
    double _heigth = 0;
    EdgeInsets _padding = EdgeInsets.zero;

    if (state is Empty || state is Loading) {
      _card = SummaryCardLoading();
      _padding = SummaryCardLoading.padding;
      _heigth = SummaryCardLoading.cardHeight;
    } else if (state is Loaded) {
      _card = SummaryCard(wealthSummary: state.wealthSummary);
      _padding = SummaryCard.padding;
      _heigth = SummaryCard.cardHeigtht;
    } else if (state is Error) {
      _card = ErrorCard(
        message: state.message,
        onTapReload: () {
          sl<WealthSummaryBloc>().add(GetWealthSummaryForCard());
        },
      );
      _padding = ErrorCard.padding;
      _heigth = ErrorCard.cardHeigth;
    } else if (state is NotConnected) {
      _card = NoConnectionCard();
      _padding = NoConnectionCard.padding;
      _heigth = NoConnectionCard.cardHeight;
    }

    return CardBase(child: _card, padding: _padding, height: _heigth);
  }
}
