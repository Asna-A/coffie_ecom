// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coffie_ecom/application/home_page_bloc/home_page_bloc.dart'
    as _i234;
import 'package:coffie_ecom/domain/IHomeRepo/IHomeRepo.dart' as _i819;
import 'package:coffie_ecom/infrastructure/home_repository/home_repository.dart'
    as _i311;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i819.IHomeRepo>(() => _i311.HomeRepository());
    gh.factory<_i234.HomePageBloc>(
        () => _i234.HomePageBloc(gh<_i819.IHomeRepo>()));
    return this;
  }
}
