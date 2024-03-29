import 'package:get_it/get_it.dart';
import 'package:hama_app/common/utils/cache_utils.dart';
import 'package:hama_app/data/datasource/auth/auth_remote_data_source.dart';
import 'package:hama_app/data/datasource/daily/daily_remote_data_source.dart';
import 'package:hama_app/data/datasource/index/index_hama_remote_data_source.dart';
import 'package:hama_app/data/datasource/inspeksi/inspeksi_remote_data_source.dart';
import 'package:hama_app/data/datasource/order/order_remote_data_source.dart';
import 'package:hama_app/data/datasource/pemakaian/pemakaian_remote_data_source.dart';
import 'package:hama_app/data/datasource/peralatan/peralatan_remote_data_source.dart';
import 'package:hama_app/data/datasource/personal/personal_remote_data_source.dart';
import 'package:hama_app/data/datasource/signature/signature_local_data_source.dart';
import 'package:hama_app/data/db/database_helper.dart';
import 'package:hama_app/data/repositories/auth_repository_impl.dart';
import 'package:hama_app/data/repositories/daily_repository_impl.dart';
import 'package:hama_app/data/repositories/index_hama_repository_impl.dart';
import 'package:hama_app/data/repositories/inspeksi_repository_impl.dart';
import 'package:hama_app/data/repositories/order_repository_impl.dart';
import 'package:hama_app/data/repositories/pemakaian_repository_impl.dart';
import 'package:hama_app/data/repositories/peralatan_repository_impl.dart';
import 'package:hama_app/data/repositories/personal_repository_impl.dart';
import 'package:hama_app/data/repositories/signature_repository_impl.dart';
import 'package:hama_app/domain/repositories/auth_repository.dart';
import 'package:hama_app/domain/repositories/daily_repository.dart';
import 'package:hama_app/domain/repositories/index_hama_repository.dart';
import 'package:hama_app/domain/repositories/inspeksi_repository.dart';
import 'package:hama_app/domain/repositories/order_repository.dart';
import 'package:hama_app/domain/repositories/pemakaian_repository.dart';
import 'package:hama_app/domain/repositories/peralatan_repository.dart';
import 'package:hama_app/domain/repositories/personal_repository.dart';
import 'package:hama_app/domain/repositories/signature_repository.dart';
import 'package:hama_app/domain/usecase/daily/add_daily_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_all_daily_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_all_daily_by_month_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_all_daily_usecase.dart';
import 'package:hama_app/domain/usecase/daily/get_daily_pdf_monthly_usecase.dart';
import 'package:hama_app/domain/usecase/get_all_data_order.dart';
import 'package:hama_app/domain/usecase/get_create_order.dart';
import 'package:hama_app/domain/usecase/get_login.dart';
import 'package:hama_app/domain/usecase/index_hama/add_index_hama_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_all_index_hama_by_MOnth_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_all_index_hama_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_all_index_hama_usecase.dart';
import 'package:hama_app/domain/usecase/index_hama/get_index_pdf_monthly_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/add_inspeksi_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/get_all_inspeksi_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/get_all_inspeksi_by_month_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/get_all_inspeksi_usecase.dart';
import 'package:hama_app/domain/usecase/inspeksi/get_inspeksi_pdf_monthly_usecase.dart';
import 'package:hama_app/domain/usecase/pemakaian/add_pemakaian_usecase.dart';
import 'package:hama_app/domain/usecase/pemakaian/get_all_pemakaian_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/pemakaian/get_all_pemakaian_by_month.dart';
import 'package:hama_app/domain/usecase/pemakaian/get_all_pemakaian_usecase.dart';
import 'package:hama_app/domain/usecase/pemakaian/get_pemakaian_pdf_monthly_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/add_peralatan_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/get_all_peralatan_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/get_peralatan_by_date_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/get_peralatan_by_month_usecase.dart';
import 'package:hama_app/domain/usecase/peralatan/get_peralatan_pdf_monthly_usecase.dart';
import 'package:hama_app/domain/usecase/personel/get_absen_by_date.dart';
import 'package:hama_app/domain/usecase/personel/get_absen_by_id.dart';
import 'package:hama_app/domain/usecase/personel/get_absen_pdf_monthly_usecase.dart';
import 'package:hama_app/domain/usecase/personel/get_absen_person_by_month.dart';
import 'package:hama_app/domain/usecase/personel/get_add_absen.dart';
import 'package:hama_app/domain/usecase/personel/get_add_personal.dart';
import 'package:hama_app/domain/usecase/personel/get_all_personal.dart';
import 'package:hama_app/domain/usecase/personel/get_delete_personal.dart';
import 'package:hama_app/domain/usecase/personel/get_update_personal.dart';
import 'package:hama_app/domain/usecase/personel/logout_usecase.dart';
import 'package:hama_app/domain/usecase/signature/clear_signature_usecase.dart';
import 'package:hama_app/domain/usecase/signature/delete_signature_usecase.dart';
import 'package:hama_app/domain/usecase/signature/get_all_signature_usecase.dart';
import 'package:hama_app/domain/usecase/signature/save_signature_usecase.dart';
import 'package:hama_app/domain/usecase/signature/select_signature_usecase.dart';
import 'package:hama_app/presentation/bloc/absen/absen_bloc.dart';
import 'package:hama_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:hama_app/presentation/bloc/dailiy/daily_bloc.dart';
import 'package:hama_app/presentation/bloc/index_hama/index_hama_bloc.dart';
import 'package:hama_app/presentation/bloc/inspeksi/inspeksi_bloc.dart';
import 'package:hama_app/presentation/bloc/order/order_bloc.dart';
import 'package:hama_app/presentation/bloc/pemakaian/pemakaian_bloc.dart';
import 'package:hama_app/presentation/bloc/peralatan/peralatan_bloc.dart';
import 'package:hama_app/presentation/bloc/personel/personel_bloc.dart';
import 'package:hama_app/presentation/bloc/signature/signature_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart' as pref;

final locator = GetIt.instance;

void init() {
// datasource
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<PersonalRemoteDataSource>(
      () => PersnoalRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<PeralatanRemoteDataSource>(
      () => PeralatanRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<PemakaianRemoteDataSource>(
      () => PemakaianRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<DailyRemoteDataSource>(
      () => DailyRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<InspeksiRemoteDataSource>(
      () => InspeksiRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<IndexHamaRemoteDataSource>(
      () => IndexHamaRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<SignatureLocalDataSource>(
      () => SignatureLocalDataSourceImpl(databaseHelper: locator()));

//repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<PersonalRepository>(
      () => PersonalRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<PeralatanRepository>(
      () => PeralatanRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<PemakaianRepository>(
      () => PemakaianRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<DailyRepository>(
      () => DailyRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<InspeksiRepository>(
      () => InspeksiRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<IndexHamaRepository>(
      () => IndexhamaRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<SignatureRepository>(
      () => SignatureRepositoryImpl(localDataSource: locator()));

//usecase
  locator.registerLazySingleton(() => GetLogin(locator()));
  locator.registerLazySingleton(() => LogoutUsecase(locator()));

  locator.registerLazySingleton(() => GetAbsenByDate(locator()));
  locator.registerLazySingleton(() => GetAbsenById(locator()));
  locator.registerLazySingleton(() => GetAddAbsen(locator()));
  locator.registerLazySingleton(() => GetAbsenPersonByMonth(locator()));
  locator.registerLazySingleton(() => GetAbsenPDFMonthlyUsecase(locator()));

  locator.registerLazySingleton(() => GetAddPersonal(locator()));
  locator.registerLazySingleton(() => GetAllPersonal(locator()));
  locator.registerLazySingleton(() => GetDeletePersonal(locator()));
  locator.registerLazySingleton(() => GetUpdatePersonal(locator()));

  locator.registerLazySingleton(() => GetCreateOrder(locator()));
  locator.registerLazySingleton(() => GetAllDataOrder(locator()));

  locator.registerLazySingleton(() => AddPeralatanUsecase(locator()));
  locator.registerLazySingleton(() => GetAllPeralatanUsecase(locator()));
  locator.registerLazySingleton(() => GetAllPeralatanByDateUsecase(locator()));
  locator.registerLazySingleton(() => GetAllPeralatanByMonthUsecase(locator()));
  locator.registerLazySingleton(() => GetPeralatanMonthlyUsecase(locator()));

  locator.registerLazySingleton(() => AddPemakaianUsecase(locator()));
  locator.registerLazySingleton(() => GetAllPemakaianUsecase(locator()));
  locator.registerLazySingleton(() => GetAllPemakaianByDateUsecase(locator()));
  locator.registerLazySingleton(() => GetAllPemakaianByMonthUsecase(locator()));
  locator.registerLazySingleton(() => GetPemakaianMonthlyUsecase(locator()));

  locator.registerLazySingleton(() => AddDailyUsecase(locator()));
  locator.registerLazySingleton(() => GetAllDailyUsecase(locator()));
  locator.registerLazySingleton(() => GetAllDailyByDateUsecase(locator()));
  locator.registerLazySingleton(() => GetAllDailyByMonthUsecase(locator()));
  locator.registerLazySingleton(() => GetDailyPDFMonthlyUsecase(locator()));

  locator.registerLazySingleton(() => AddInspeksiUsecase(locator()));
  locator.registerLazySingleton(() => GetAllInspeksiUsecase(locator()));
  locator.registerLazySingleton(() => GetAllInspeksiByDateUsecase(locator()));
  locator.registerLazySingleton(() => GetAllInspeksiByMonthUsecase(locator()));
  locator.registerLazySingleton(() => GetInspeksiMonthlyUsecase(locator()));

  locator.registerLazySingleton(() => AddIndexHamaUsecase(locator()));
  locator.registerLazySingleton(() => GetAllIndexHamaUsecase(locator()));
  locator.registerLazySingleton(() => GetAllIndexHamaByDateUsecase(locator()));
  locator.registerLazySingleton(() => GetAllIndexHamaByMonthUsecase(locator()));
  locator.registerLazySingleton(() => GetIndexPdfMonthlyUsecase(locator()));

  locator.registerLazySingleton(() => ClearSignatureUsecase(locator()));
  locator.registerLazySingleton(() => DeleteSignatureUsecase(locator()));
  locator.registerLazySingleton(() => GetAllSignatureUsecase(locator()));
  locator.registerLazySingleton(() => SaveSignatureUsecase(locator()));
  locator.registerLazySingleton(() => SelectSignatureUsecase(locator()));

  //bloc

  locator.registerFactory(
      () => AuthBloc(getLogin: locator(), logoutUsecase: locator()));
  locator.registerFactory(
      () => OrderBloc(getCreateOrder: locator(), getAllDataOrder: locator()));
  locator.registerFactory(() => PersonelBloc(
      getAllPersonal: locator(),
      getAddPersonal: locator(),
      getDeletePersonal: locator(),
      getUpdatePersonal: locator()));

  locator.registerFactory(() => AbsenBloc(
        getAddAbsen: locator(),
        getAbsenById: locator(),
        getAbsenPersonByMonth: locator(),
        getAbsenPDFMonthlyUsecase: locator(),
      ));

  locator.registerFactory(
    () => PeralatanBloc(
      addPeralatanUsecase: locator(),
      getAllPeralatanUsecase: locator(),
      getAllPeralatanByDateUsecase: locator(),
      getAllPeralatanByMonthUsecase: locator(),
      getPeralatanMonthlyUsecase: locator(),
    ),
  );

  locator.registerFactory(() => PemakaianBloc(
        addPemakaianUsecase: locator(),
        getAllPemakaianByMonthUsecase: locator(),
        getAllPemakaianUsecase: locator(),
        getAllPeralatanByDateUsecase: locator(),
        getPemakaianMonthlyUsecase: locator(),
      ));

  locator.registerFactory(
    () => DailyBloc(
      addDailyUsecase: locator(),
      getAllDailyUsecase: locator(),
      getAllDailyByDateUsecase: locator(),
      getAllDailyByMonthUsecase: locator(),
      getDailyPDFMonthlyUsecase: locator(),
    ),
  );

  locator.registerFactory(
    () => InspeksiBloc(
      addInspeksiUsecase: locator(),
      getAllInspeksiUsecase: locator(),
      getAllInspeksiByDateUsecase: locator(),
      getAllInspeksiByMonthUsecase: locator(),
      getInspeksiMonthlyUsecase: locator(),
    ),
  );

  locator.registerFactory(() => IndexHamaBloc(
        addIndexHamaUsecase: locator(),
        getAllIndexHamaUsecase: locator(),
        getAllIndexHamaByMonthUsecase: locator(),
        getAllIndexHamaByDateUsecase: locator(),
        getIndexPdfMonthlyUsecase: locator(),
      ));

  locator.registerFactory(() => SignatureBloc(
        saveSignatureUsecase: locator(),
        deleteSignatureUsecase: locator(),
        getAllSignatureUsecase: locator(),
        selectSignatureUsecase: locator(),
      ));

//database
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

//external
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => pref.SharedPreferences);
  locator.registerLazySingleton(() => CacheUtil());
}
