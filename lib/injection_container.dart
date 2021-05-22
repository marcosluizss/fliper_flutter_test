import 'package:connectivity_plus/connectivity_plus.dart';
import 'core/infra/network_info.dart';
import 'features/wealth_summary/data/datasources/wealth_summary_remote_datasource.dart';
import 'features/wealth_summary/data/repositories/wealth_summary_repository_impl.dart';
import 'features/wealth_summary/domain/repositories/wealth_summary_repository.dart';
import 'features/wealth_summary/domain/usecases/get_wealth_summary.dart';
import 'features/wealth_summary/presentation/bloc/wealth_summary_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(
    () => WealthSummaryBloc(
      getWealthSummary: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetWealthSummary(sl()));

  sl.registerLazySingleton<WealthSummaryRepository>(
    () => WealthSummaryRepositoryImpl(
      networkInfo: sl(),
      wealthSummaryRemoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<WealthSummaryRemoteDataSource>(
    () => WealthSummaryRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkIndoImpl(sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
