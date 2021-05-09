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
    late WealthSummaryPageCard _card;

    if (state is Empty || state is Loading) {
      _card = SummaryCardLoading();
    } else if (state is Loaded) {
      _card = SummaryCard(wealthSummary: state.wealthSummary);
    } else if (state is NotConnected) {
      _card = NoConnectionCard();
    } else {
      String message = "Falha na montagem do card";
      if (state is Error) {
        message = state.message;
      }
      _card = ErrorCard(
        message: message,
        onTapReload: () {
          sl<WealthSummaryBloc>().add(GetWealthSummaryForCard());
        },
      );
    }

    return CardBase(child: _card);
  }
}
