import 'package:adithya_horoscope/data/network/auth_network.dart';
import 'package:adithya_horoscope/data/repository/auth_repo.dart';
import 'package:adithya_horoscope/domain/abstract/auth_abstract.dart';
import 'package:adithya_horoscope/domain/usecase/auth_usecase.dart';
import 'package:kiwi/kiwi.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer container = KiwiContainer();

  static void setup() {
    container = KiwiContainer();
    _$InjectorConfig()._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container.resolve;

  void _configure() {
    _configureBlocs();
    _configureUsecases();
    _configureRepositories();
    _configureRemoteDataSources();
    //_configureLocalDataSources();
    // _configureCommon();
  }

  // ============ BLOCS ============
  void _configureBlocs();

  // ============ USECASES ============
  @Register.singleton(AuthUseCase)
  void _configureUsecases();

  // ============ REPOSITORIES ============
  @Register.singleton(AuthAbstract, from: AuthRepo)
  void _configureRepositories();

  // ============ REMOTE DATASOURCES ============
  @Register.singleton(AuthNetwork)
  void _configureRemoteDataSources();

  // ============ LOCAL DATASOURCES ============
  //  @Register.singleton(ProductLocalDatasource)
  //  void _configureLocalDataSources();

  // ============ COMMON ============
  // @Register.singleton(ACSHttpClient)
  // void _configureCommon();
}
