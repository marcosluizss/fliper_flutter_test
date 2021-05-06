import 'package:dartz/dartz.dart';
import 'package:fliper_flutter_test/core/error/failures.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/repositories/wealth_summary_repository.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWealthSummaryRepository extends Mock
    implements WealthSummaryRepository {
  @override
  Future<Either<Failure, WealthSummary>> getWealthSummary() =>
      super.noSuchMethod(Invocation.method(#getWealthSummary, [])) ??
      Future.value(Left(ServerFailure()));
}

void main() {
  late GetWealthSummary getWealthSummary;
  late MockWealthSummaryRepository mockWealthSummaryRepository;

  setUp(() {
    mockWealthSummaryRepository = MockWealthSummaryRepository();
    getWealthSummary = GetWealthSummary(mockWealthSummaryRepository);
  });

  final tWealthSummary = WealthSummary(
    id: 2,
    cdi: 3.45679,
    gain: 18833.23,
    hasHistory: true,
    profitability: 2.76789,
    total: 3200876,
  );

  test('should get summary from the repository', () async {
    when(mockWealthSummaryRepository.getWealthSummary())
        .thenAnswer((_) async => Right(tWealthSummary));

    final result = await getWealthSummary();

    expect(result, Right(tWealthSummary));
    verify(mockWealthSummaryRepository.getWealthSummary());
    verifyNoMoreInteractions(mockWealthSummaryRepository);
  });
}
