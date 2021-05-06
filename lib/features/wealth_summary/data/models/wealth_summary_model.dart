import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';

class WealthSummaryModel extends WealthSummary {
  WealthSummaryModel({
    required int id,
    required double cdi,
    required double gain,
    required bool hasHistory,
    required double profitability,
    required double total,
  }) : super(
          id: id,
          cdi: cdi,
          gain: gain,
          hasHistory: hasHistory,
          profitability: profitability,
          total: total,
        );

  factory WealthSummaryModel.fromJson(Map<String, dynamic> json) {
    return WealthSummaryModel(
      id: json["id"],
      cdi: (json["cdi"] as num).toDouble(),
      gain: (json["gain"] as num).toDouble(),
      hasHistory: json["hasHistory"],
      profitability: (json["profitability"] as num).toDouble(),
      total: (json["total"] as num).toDouble(),
    );
  }
}
