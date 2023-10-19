import 'package:flutter/material.dart';
import 'package:scott_williams_portfolio/consts/consts.dart';
import 'package:scott_williams_portfolio/presentation/widgets/main_body.dart';
import 'package:sw_dependencies/sw_dependencies.dart';
import 'package:sw_design_system/sw_design_system.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeNotifier = ThemeInheritedNotifier.of(context);
    final themeMode = themeModeNotifier.value;
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
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
          GestureDetector(
            onTap: () {
              themeModeNotifier.toggleTheme();
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidMoon,
                    color: isDark ? Consts.darkColor : Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
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
        ],
        backgroundColor: Consts.backgroundColor,
        elevation: 0,
      ),
      body: MainBody(
        isDark: isDark,
      ),
    );
  }
}
