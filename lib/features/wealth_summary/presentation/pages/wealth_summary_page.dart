import 'package:fliper_flutter_test/features/wealth_summary/presentation/bloc/wealth_summary_bloc.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (_) => sl<WealthSummaryBloc>()..add(StartLoadPage()),
      child: SafeArea(
        child: Container(
          child: Center(
            child: BlocBuilder<WealthSummaryBloc, WealthSummaryState>(
              builder: (_, state) {
                if (state is Empty || state is Loading) {
                  return SummaryCardLoading();
                } else if (state is Loaded) {
                  return SummaryCard(wealthSummary: state.wealthSummary);
                } else if (state is Error) {
                  return ErrorCard(message: state.message);
                } else if (state is NotConnected) {
                  return NoConnectionCard();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
