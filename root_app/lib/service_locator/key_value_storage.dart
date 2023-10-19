import 'package:sw_dependencies/sw_dependencies.dart';
import 'package:sw_key_value_storage_impl/sw_key_value_storage_impl.dart';

void registerKeyValueStorageDependencies() {
  GetIt.instance.registerSingletonAsync<SharedPreferences>(
    () async => SharedPreferences.getInstance(),
  );

  GetIt.instance.registerLazySingleton<IKeyValueStorage>(
    () => SharedPreferencesClient(GetIt.instance<SharedPreferences>()),
  );
}
