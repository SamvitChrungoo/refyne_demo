import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:refyne_demo/helpers/injection.config.dart';

final getItInstance = GetIt.instance;

@InjectableInit()
void configureInjetions() => $initGetIt(getItInstance);
