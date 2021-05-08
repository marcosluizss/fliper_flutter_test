import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fliper_flutter_test/core/error/failures.dart';
import 'package:fliper_flutter_test/core/infra/network_info.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';

part 'wealth_summary_event.dart';
part 'wealth_summary_state.dart';

const NO_CONNECTION_FAILURE_MESSAGE = "Sem conexão";
const SERVER_FAILURE_MESSAGE = "Falha no servidor";

class WealthSummaryBloc extends Bloc<WealthSummaryEvent, WealthSummaryState> {
  final GetWealthSummary getWealthSummary;
  final NetworkInfo networkInfo;
  StreamSubscription? _subscription;

  WealthSummaryBloc({required this.getWealthSummary, required this.networkInfo})
      : super(Empty());

  @override
  Stream<WealthSummaryState> mapEventToState(
    WealthSummaryEvent event,
  ) async* {
    if (event is StartLoadPage) {
      await _subscription?.cancel();
      _subscription = networkInfo.onConnectivityChanged().listen(
          (connected) => add(GetWealthSummaryForCard(isConnected: connected)));
    }
    if (event is GetWealthSummaryForCard) {
      if (event.isConnected == false) {
        yield NotConnected();
      } else {
        yield* getCardData();
      }
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Stream<WealthSummaryState> getCardData() async* {
    yield Loading();
    final failureorWealth = await getWealthSummary();
    yield failureorWealth.fold(
      (failure) => _mapFailure(failure),
      (wealthSummary) => Loaded(wealthSummary: wealthSummary),
    );
  }

  WealthSummaryState _mapFailure(Failure failure) {
    switch (failure.runtimeType) {
      case NotConnected:
        return NotConnected();
      default:
        return Error(
          message: _mapFailureToMessage(failure),
        );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Erro inesperado';
    }
  }
}
