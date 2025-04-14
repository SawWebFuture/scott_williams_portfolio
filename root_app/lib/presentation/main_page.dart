import 'package:flutter/material.dart';
import 'package:mfe_home/widgets/home_page.dart';
import 'package:scott_williams_portfolio/consts/consts.dart';
import 'package:scott_williams_portfolio/presentation/notifiers/main_notifier.dart';
import 'package:scott_williams_portfolio/presentation/notifiers/main_state.dart';
import 'package:scott_williams_portfolio/presentation/widgets/main_body.dart';
import 'package:scott_williams_portfolio/presentation/widgets/main_loading.dart';
import 'package:sw_dependencies/sw_dependencies.dart';
import 'package:sw_design_system/sw_design_system.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final MainNotifier mainNotifier;

  @override
  void initState() {
    super.initState();
    GetIt.instance.registerFactory<MainNotifier>(
      () => MainNotifier(),
    );
    mainNotifier = GetIt.I.get<MainNotifier>();
    _checkHiveForName();
  }


  Future<void> _checkHiveForName() async {
    // Open the Hive box.
    var box = await Hive.openBox('nameBox');
    var nameFromBox = box.get('name') as String?;

    // Update the notifier based on whether a name was retrieved.
    // If no name exists, we assume the user needs to log in.
    if (nameFromBox == null || nameFromBox.isEmpty) {
      mainNotifier.changeStatus(status: MainStatus.login, name: '');
    } else {
      mainNotifier.changeStatus(status: MainStatus.home, name: nameFromBox);
    }
  }

  // final _navigatorList = <Navigator>[
  //   Navigator(
  //     initialRoute: HomeRoutes.home,
  //     onGenerateRoute: (settings) =>
  //         HomeMicroFrontend().generateNestedRoute(settings: settings),
  //   ),
  //   // Navigator(
  //   //   initialRoute: ScheduleRoutes.scheduleOverview,
  //   //   onGenerateRoute: (settings) =>
  //   //       ScheduleMicroFrontend().generateNestedRoute(settings: settings),
  //   // ),
  // ];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeInheritedNotifier.of(context);
    final themeState = themeNotifier.value;
    final isDark = themeState.themeMode == ThemeMode.dark;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Scott Alan Williams',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: isDark ? Consts.darkColor : Colors.white,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Motion(
            borderRadius: BorderRadius.circular(360),
            shadow: ShadowConfiguration(
              color: isDark ? Colors.black : Consts.darkColor,
              maxOffset: const Offset(1, 1),
              topOffset: 1,
            ),
            translation: const TranslationConfiguration(
              maxOffset: Offset(20, 20),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/scott_image.jpg'),
            ),
          ),
        ),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                ThemeInheritedNotifier.of(context).toggleTheme(isDark);
              },
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidMoon,
                      color: isDark ? Consts.darkColor : Colors.white,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Dark Mode',
                      style: TextStyle(
                        fontSize: 9,
                        color: isDark ? Consts.darkColor : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Consts.backgroundColor,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: mainNotifier,
        builder: (_, state, __) {
          return switch (state.status) {
            MainStatus.loading => const MainLoading(),
            MainStatus.login => MainBody(
                isDark: isDark,
                onPageChange: (value) {
                  mainNotifier.changeStatus(
                    status: MainStatus.home,
                    name: value,
                  );
                }),
            MainStatus.home => HomePage(
                name: state.name,
                isDark: isDark,
              ),
          };
        },
      ),
    );
  }
}
