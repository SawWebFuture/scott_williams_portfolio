import 'package:sw_dependencies/sw_dependencies.dart';
import 'package:sw_design_system/sw_design_system.dart';

void registerThemeDependencies() {
  // Theme
  GetIt.instance.registerLazySingleton<ThemeNotifier>(
    () => ThemeNotifier(storage: GetIt.instance()),
  );
}
