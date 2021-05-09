import 'package:equatable/equatable.dart';

class WealthSummary extends Equatable {
  final int id;

  final double cdi;
  final double gain;
  final bool hasHistory;
  final double profitability;
  final double total;

  WealthSummary({
    required this.id,
    required this.cdi,
    required this.gain,
    required this.hasHistory,
    required this.profitability,
    required this.total,
  });

  @override
  List<Object> get props => [id, cdi, gain, hasHistory, profitability, total];
}
