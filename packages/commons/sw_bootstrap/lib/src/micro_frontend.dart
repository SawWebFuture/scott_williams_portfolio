import 'package:flutter/material.dart';

abstract class MicroFrontend {
  String get name;

  void registerDependencies();

  Map<String, Widget Function(BuildContext context, Object? args)> get routes;

  Map<String, Widget Function(BuildContext context, Object? args)>
      get nestedRoutes;

  // ignore_for_file: avoid-dynamic
  Route<dynamic>? generateNestedRoute({
    required RouteSettings settings,
    Object? initialPageArgs,
  }) {
    final route = settings.name;
    final args = settings.arguments;

    final navigationRoute = nestedRoutes[route];

    if (navigationRoute == null) return null;

    if (initialPageArgs != null) {
      return MaterialPageRoute(
        builder: (context) => navigationRoute.call(context, initialPageArgs),
        settings: settings,
      );
    }

    return MaterialPageRoute(
      builder: (context) => navigationRoute.call(context, args),
      settings: settings,
    );
  }
}
