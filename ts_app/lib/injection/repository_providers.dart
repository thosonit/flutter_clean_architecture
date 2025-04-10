import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ts_data/app_config.dart';
import 'package:ts_data/datasources/auth_local_datasource.dart';
import 'package:ts_data/datasources/auth_local_datasource_impl.dart';
import 'package:ts_data/datasources/auth_remote_datasource.dart';
import 'package:ts_data/datasources/auth_remote_datasource_impl.dart';
import 'package:ts_data/helpers/network/api_client.dart';
import 'package:ts_data/helpers/network/api_utils.dart';
import 'package:ts_data/repositories/auth_repository_impl.dart';
import 'package:ts_domain/repositories/auth_repository.dart';

List<SingleChildWidget> createRepositoryProviders() {
  final apiClient = ApiClient(ApiUtil.getDio(), baseUrl: AppConfig.apiBaseUrl);
  return [
    Provider<AuthRemoteDataSource>(
      create: (_) => AuthRemoteDataSourceImpl(apiClient: apiClient),
    ),
    Provider<AuthLocalDataSource>(create: (_) => AuthLocalDataSourceImpl()),
    Provider<AuthRepository>(
      create:
          (context) => AuthRepositoryImpl(
            remoteDataSource: context.read<AuthRemoteDataSource>(),
            localDataSource: context.read<AuthLocalDataSource>(),
          ),
    ),
  ];
}
