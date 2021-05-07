import 'package:dartz/dartz.dart';
import 'package:fliper_flutter_test/core/error/failures.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/bloc/wealth_summary_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetWealthSummary extends Mock implements GetWealthSummary {
  @override
  Future<Either<Failure, WealthSummary>> call() =>
      super.noSuchMethod(Invocation.method(#call, [])) ??
      Future.value(Left(ServerFailure()));
}

void main() {
  late WealthSummaryBloc bloc;
  late MockGetWealthSummary mockGetWealthSummary;

  setUp(() {
    mockGetWealthSummary = MockGetWealthSummary();
    bloc = WealthSummaryBloc(getWealthSummary: mockGetWealthSummary);
  });

  test('Initial state should be Empty', () {
    expect(bloc.state, Empty());
  });

  group('getWealthSummary', () {
    final tWealthSummary = WealthSummary(
      id: 2,
      cdi: 3.45679,
      gain: 18833.23,
      hasHistory: true,
      profitability: 2.76789,
      total: 3200876,
    );

    test('Initial state should be Empty', () {
      expect(bloc.state, Empty());
    });

    test('should get data from wealth summary use case', () async {
      when(mockGetWealthSummary())
          .thenAnswer((_) async => Right(tWealthSummary));

      bloc.add(GetWealthSummaryForCard());
      await untilCalled(mockGetWealthSummary());

      verify(mockGetWealthSummary());
    });

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        when(mockGetWealthSummary())
            .thenAnswer((_) async => Right(tWealthSummary));
        final expected = [
          Loading(),
          Loaded(wealthSummary: tWealthSummary),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));

        bloc.add(GetWealthSummaryForCard());
      },
    );

    test(
      'should emit [Loading, Error] when gets a no connection failure',
      () async {
        when(mockGetWealthSummary())
            .thenAnswer((_) async => Left(NotConnectedFailure()));
        final expected = [
          Loading(),
          Error(message: NO_CONNECTION_FAILURE_MESSAGE),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));

        bloc.add(GetWealthSummaryForCard());
      },
    );

    test(
      'should emit [Loading, Error] when gets a server error failure',
      () async {
        when(mockGetWealthSummary())
            .thenAnswer((_) async => Left(ServerFailure()));
        final expected = [
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));

        bloc.add(GetWealthSummaryForCard());
      },
    );
  });
}
