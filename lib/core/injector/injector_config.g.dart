// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {}
  @override
  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => AuthUseCase(c<AuthAbstract>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<AuthAbstract>((c) => AuthRepo());
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => AuthNetwork());
  }
}
