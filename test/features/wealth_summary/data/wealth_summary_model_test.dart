import 'dart:convert';

import 'package:fliper_flutter_test/features/wealth_summary/data/models/wealth_summary_model.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixture/fixture_reader.dart';

void main() {
  final WealthSummaryModel tWealthSummaryModel = WealthSummaryModel(
    id: 2,
    cdi: 3.45679,
    gain: 1833.23,
    hasHistory: true,
    profitability: 2.76789,
    total: 3200876,
  );

  test('should be a subclass of WealthSummary entity', () {
    expect(tWealthSummaryModel, isA<WealthSummary>());
  });

  group('fromJson', () {
    test('should return a valid model when try parse', () {
      final Map<String, dynamic> jsonMap = json.decode(
        fixture('wealth_summary.json'),
      );

      final result = WealthSummaryModel.fromJson(jsonMap);

      expect(result, tWealthSummaryModel);
    });
  });
}
