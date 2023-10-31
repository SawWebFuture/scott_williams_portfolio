import 'package:flutter/material.dart';
import 'package:mfe_home/routes/home_routes.dart';
import 'package:mfe_home/widgets/home_page.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class HomeMicroFrontend implements MicroFrontend {
  @override
  Route<Object>? generateNestedRoute({
    required RouteSettings settings,
    Object? initialPageArgs,
  }) {
    return null;
  }

  @override
  String get name => 'home';

  @override
  void registerDependencies() {
    // Datasources
    // GetIt.instance.registerLazySingleton<IContentDatasource>(
    //       () => ContentDatasourceImpl(httpClient: GetIt.instance()),
    // );

    // Repositories
    // GetIt.instance.registerLazySingleton<ContentRepository>(
    //       () => ContentRepository(datasource: GetIt.instance()),
    // );

    // Usecases
    // GetIt.instance.registerLazySingleton<GetVideosUsecase>(
    //       () => GetVideosUsecase(repository: GetIt.instance()),
    // );

    // Notifiers
    // GetIt.instance.registerFactory<ContentsNotifier>(
    //       () => ContentsNotifier(getVideosUsecase: GetIt.instance()),
    // );
  }

  @override
  Map<String, Widget Function(BuildContext context, Object? args)>
      get nestedRoutes => {
            HomeRoutes.home: (context, args) => const HomePage(),
          };

  @override
  Map<String, Widget Function(BuildContext context, Object? args)> get routes =>
      {
        // ContentRoutes.videoContent: (context, args) => ContentVideosPage(
        //   contentVideoNotifier: GetIt.instance(),
        //   getThumbnailUrlUsecase: GetIt.instance(),
        // ),
      };
}
