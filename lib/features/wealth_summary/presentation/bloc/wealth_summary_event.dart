part of 'wealth_summary_bloc.dart';

abstract class WealthSummaryEvent extends Equatable {
  const WealthSummaryEvent();

  @override
  List<Object> get props => [];
}

class GetWealthSummaryForCard extends WealthSummaryEvent {}
