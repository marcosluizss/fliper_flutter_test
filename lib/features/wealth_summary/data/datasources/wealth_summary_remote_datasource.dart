import 'package:fliper_flutter_test/features/wealth_summary/data/models/wealth_summary_model.dart';

abstract class WealthSummaryRemoteDataSource {
  Future<WealthSummaryModel> getWealthSummary();
}
