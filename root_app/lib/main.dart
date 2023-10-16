import 'package:flutter/material.dart';
import 'package:scott_williams_portfolio/presentation/main_page.dart';
import 'package:scott_williams_portfolio/routes/root_app_routes.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget with RootApp {
  MyApp({super.key}) {
    registerDependencies();
    registerListeners();
    registerNavRoutes();
  }

  @override
  List<MicroFrontend> get microApps => [
        // HomeMicroFrontend(),
      ];

  @override
  String get name => 'root_app';

  @override
  void registerDependencies() {
    for (MicroFrontend microApp in microApps) {
      microApp.registerDependencies();
    }

    //TODO
    // registerHttpDependencies();
    //
    // registerKeyValueStorageDependencies();
    //
    // registerUserDependencies();
    //
    // registerPlatformDependencies();
    //
    // registerThemeDependencies();

    //Side Menu
    // GetIt.instance.registerLazySingleton<ISideMenuDatasource>(
    //       () => SideMenuDatasourceImpl(httpClient: GetIt.instance()),
    // );
  }

  @override
  void registerNavRoutes() {
    if (assembleRoutes.isNotEmpty) {
      routes.addAll(assembleRoutes);
    }

    for (MicroFrontend microApp in microApps) {
      routes.addAll(microApp.routes);
    }
  }

  // ignore_for_file: avoid-dynamic
  @override
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final route = settings.name;
    final args = settings.arguments;

    final navigationRoute = routes[route];
    if (navigationRoute == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigationRoute.call(context, args),
      settings: settings,
    );
  }

  @override
  void registerListeners() {
    //TODO: add event bus service
    // EventBusService.eventBusListener((IEventBusCategory event) async {
    //   if (event is GoToLoginPage) {
    //     Navigator.of(event.context).pushNamedAndRemoveUntil(
    //       IntroRoutes.login,
    //           (route) => false,
    //     );
    //   }
    // });
  }

  @override
  Map<String, Widget Function(BuildContext context, Object? args)>
      get assembleRoutes => {
            RootAppRoutes.main: (context, args) => const MainPage(),
            // QRCodeRoutes.userQRCode: (context, args) => UserQRCodePage(
            //   contactId: (args as Map<String, dynamic>)['contactId'],
            //   qrLink: (args)['qrLink'],
            //   screenBrightnessService: GetIt.instance(),
            // ),
            // DesignSystemRoutes.webViewPage: (context, args) =>
            //     CustomWebViewPage(
            //       pageTitle: (args as Map<String, dynamic>)['pageTitle'],
            //       webviewUrl: (args)['webviewUrl'],
            //     ),
          };

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Future<void> checkSharedPreferencesFuture;
  @override
  void initState() {
    super.initState();
    // checkSharedPreferencesFuture = GetIt.instance.isReady<SharedPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        initialRoute: '/main',
        onGenerateRoute: widget.generateRoute,
        title: 'Scott Williams Portfolio',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        //   fontFamily: 'Mont',
        // ),
        // darkTheme: ThemeData(
        //   primarySwatch: Colors.red,
        //   fontFamily: 'Mont',
        // ),
        // themeMode: ThemeInheritedNotifier.of(context).value,
      ),
    );
  }
}
