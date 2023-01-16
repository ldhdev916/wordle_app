import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle_app/common/di/get_it.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();
