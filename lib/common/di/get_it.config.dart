// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:wordle_app/application/service/word_validator.dart' as _i6;
import 'package:wordle_app/application/service/wordle_progress_service.dart'
    as _i8;
import 'package:wordle_app/application/service/wordle_retrieve_service.dart'
    as _i12;
import 'package:wordle_app/common/di/app_module.dart' as _i14;
import 'package:wordle_app/common/rest/rest_client.dart' as _i5;
import 'package:wordle_app/domain/factory/game_factory.dart' as _i9;
import 'package:wordle_app/domain/repository/game_repository.dart' as _i3;
import 'package:wordle_app/infrastructure/factory/rest_game_factory.dart'
    as _i10;
import 'package:wordle_app/infrastructure/repository/in_memory_game_repository.dart'
    as _i4;
import 'package:wordle_app/infrastructure/service/rest_word_validator.dart'
    as _i7;
import 'package:wordle_app/presentation/bloc/validate/validate_bloc.dart'
    as _i11;
import 'package:wordle_app/presentation/bloc/wordle_bloc.dart' as _i13;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.GameRepository>(() => _i4.InMemoryGameRepository());
    gh.factory<_i5.RestClient>(() => appModule.restClient);
    gh.lazySingleton<_i6.WordValidator>(
        () => _i7.RestWordValidator(gh<_i5.RestClient>()));
    gh.lazySingleton<_i8.WordleProgressService>(() => _i8.WordleProgressService(
          gh<_i3.GameRepository>(),
          gh<_i6.WordValidator>(),
        ));
    gh.lazySingleton<_i9.GameFactory>(
        () => _i10.RestGameFactory(gh<_i5.RestClient>()));
    gh.factory<_i11.ValidateBloc>(
        () => _i11.ValidateBloc(gh<_i6.WordValidator>()));
    gh.lazySingleton<_i12.WordleRetrieveService>(
        () => _i12.WordleRetrieveService(
              gh<_i3.GameRepository>(),
              gh<_i9.GameFactory>(),
            ));
    gh.factory<_i13.WordleBloc>(() => _i13.WordleBloc(
          gh<_i12.WordleRetrieveService>(),
          gh<_i8.WordleProgressService>(),
        ));
    return this;
  }
}

class _$AppModule extends _i14.AppModule {}
