part of 'wealth_summary_bloc.dart';

abstract class WealthSummaryState extends Equatable {
  const WealthSummaryState();

  @override
  List<Object> get props => [];
}

class Empty extends WealthSummaryState {}

class Loading extends WealthSummaryState {}

class NotConnected extends WealthSummaryState {}

class Loaded extends WealthSummaryState {
  final WealthSummary wealthSummary;

  Loaded({required this.wealthSummary});

  @override
  List<Object> get props => [wealthSummary];
}

class Error extends WealthSummaryState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
