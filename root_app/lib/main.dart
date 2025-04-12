import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mfe_home/home_microfrontend.dart';
import 'package:scott_williams_portfolio/presentation/main_page.dart';
import 'package:scott_williams_portfolio/routes/root_app_routes.dart';
import 'package:scott_williams_portfolio/service_locator/key_value_storage.dart';
import 'package:scott_williams_portfolio/service_locator/theme.dart';
import 'package:sw_dependencies/sw_dependencies.dart';
import 'package:sw_design_system/sw_design_system.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'consts/consts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Web-safe Hive init
    await Hive.initFlutter();
  } else {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  // Lock to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Motion.instance.initialize();

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
        HomeMicroFrontend(),
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
    registerKeyValueStorageDependencies();
    //
    // registerUserDependencies();
    //
    // registerPlatformDependencies();

    registerThemeDependencies();

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
    checkSharedPreferencesFuture = GetIt.instance.isReady<SharedPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkSharedPreferencesFuture,
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return AnimatedContainer(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Consts.backgroundColor, Consts.lightDarkColor],
                ),
              ),
              curve: Curves.easeInCubic,
              duration: const Duration(milliseconds: 3500),
            );
          }

          return ThemeInheritedNotifier(
            notifier: GetIt.instance<ThemeNotifier>(),
            child: SafeArea(
              child: MaterialApp(
                initialRoute: '/main',
                onGenerateRoute: widget.generateRoute,
                title: 'Scott Williams Portfolio',
                theme: ThemeData(
                  primaryColor: HexColor('#448ea2'),
                  primarySwatch: getMaterialColor(HexColor('#448ea2')),
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: Consts.backgroundColor,
                  ),
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: HexColor('#474787'),
                    secondary: HexColor('#2C2C54'),
                  ),
                  textTheme: TextTheme(
                    titleMedium: TextStyle(color: Consts.darkColor),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    focusColor: Consts.backgroundColor,
                    hoverColor: Consts.backgroundColor,
                    prefixIconColor: Consts.backgroundColor,
                    iconColor: Consts.darkColor,
                    counterStyle: TextStyle(color: Consts.backgroundColor),
                    labelStyle: TextStyle(
                      color: Consts.backgroundColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Consts.backgroundColor,
                      ),
                    ),
                  ),
                  fontFamily: 'Myriad',
                ),
                debugShowCheckedModeBanner: false,
                // darkTheme: ThemeData(
                //   primarySwatch: Colors.red,
                //   fontFamily: 'Mont',
                // ),
                themeMode: ThemeMode.light,
              ),
            ),
          );
        });
  }

  MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(color.value, shades);
  }
}
