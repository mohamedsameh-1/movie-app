// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/data/datasources/contract/auth_data_source.dart'
    as _i244;
import '../../feature/auth/data/datasources/impl/auth_data_source_impl.dart'
    as _i490;
import '../../feature/auth/data/repo/auth_repo_impl.dart' as _i945;
import '../../feature/auth/domain/repo/auth_repo.dart' as _i1021;
import '../../feature/auth/domain/usecase/log_in_use_case.dart' as _i73;
import '../../feature/auth/domain/usecase/register_use_case.dart' as _i717;
import '../../feature/auth/ui/viewmodel/login/log_in_cubit.dart' as _i1069;
import '../../feature/auth/ui/viewmodel/register/register_cubit.dart' as _i518;
import '../api/api_manger.dart' as _i339;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i244.AuthDataSource>(
      () => _i490.AuthDataSourceImpl(apiManger: gh<_i339.ApiManger>()),
    );
    gh.factory<_i1021.AuthrRepo>(
      () => _i945.AuthRepoImpl(authDataSource: gh<_i244.AuthDataSource>()),
    );
    gh.factory<_i73.LogInUseCase>(
      () => _i73.LogInUseCase(authrRepo: gh<_i1021.AuthrRepo>()),
    );
    gh.factory<_i717.RegisterUseCase>(
      () => _i717.RegisterUseCase(authrRepo: gh<_i1021.AuthrRepo>()),
    );
    gh.factory<_i518.RegisterCubit>(
      () => _i518.RegisterCubit(
        gh<_i717.RegisterUseCase>(),
        gh<_i73.LogInUseCase>(),
      ),
    );
    gh.factory<_i1069.LogInCubit>(
      () => _i1069.LogInCubit(gh<_i73.LogInUseCase>()),
    );
    return this;
  }
}
