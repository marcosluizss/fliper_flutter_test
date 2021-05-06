import 'package:fliper_flutter_test/core/helpers/converters.dart';
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
      cdi: getDouble(json["cdi"]),
      gain: getDouble(json["gain"]),
      hasHistory: json["hasHistory"],
      profitability: getDouble(json["profitability"]),
      total: getDouble(json["total"]),
    );
  }
}
