import 'package:flutter/cupertino.dart';
import 'package:sw_bootstrap/sw_bootstrap.dart';

abstract mixin class RootApp {
  String get name;

  List<MicroFrontend> get microApps;

  void registerDependencies();

  void registerListeners();

  final routes =
      <String, Widget Function(BuildContext context, Object? args)>{};

  Map<String, Widget Function(BuildContext context, Object? args)>
      get assembleRoutes;

  void registerNavRoutes();

  // ignore_for_file: avoid-dynamic
  Route<dynamic>? generateRoute(RouteSettings settings);
}
