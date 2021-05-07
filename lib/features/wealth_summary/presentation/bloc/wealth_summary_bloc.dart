import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fliper_flutter_test/core/error/failures.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';

part 'wealth_summary_event.dart';
part 'wealth_summary_state.dart';

const NO_CONNECTION_FAILURE_MESSAGE = "Sem conexão";
const SERVER_FAILURE_MESSAGE = "Falha no servidor";

class WealthSummaryBloc extends Bloc<WealthSummaryEvent, WealthSummaryState> {
  final GetWealthSummary getWealthSummary;

  WealthSummaryBloc({required this.getWealthSummary}) : super(Empty());

  @override
  Stream<WealthSummaryState> mapEventToState(
    WealthSummaryEvent event,
  ) async* {
    if (event is GetWealthSummaryForCard) {
      yield Loading();
      final failureorWealth = await getWealthSummary();
      yield failureorWealth.fold(
        (failure) => Error(
          message: _mapFailureToMessage(failure),
        ),
        (wealthSummary) => Loaded(wealthSummary: wealthSummary),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NotConnectedFailure:
        return NO_CONNECTION_FAILURE_MESSAGE;
      default:
        return 'Erro inesperado';
    }
  }
}
