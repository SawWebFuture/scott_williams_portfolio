import 'package:flutter/material.dart';
import 'package:mfe_home/widgets/widgets/home_date.dart';
import 'package:mfe_home/widgets/widgets/home_header.dart';
import 'package:mfe_home/widgets/widgets/home_portfolio_item.dart';
import 'package:mfe_home/widgets/widgets/home_portfolio_item_dialog/home_portfolio_dialog.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.name,
    required this.isDark,
  });

  final String name;
  final bool isDark;

  void launchDialog(
      {required BuildContext context,
      required String name,
      List<String> links = const []}) {
    showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return HomePortfolioDialog(name: name, links: links);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDark ? HexColor('#052d2d') : Colors.white,
      child: Column(
        children: [
          HomeHeader(
            isDark: isDark,
            name: name,
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 55,),
                const HomeDate(date: '2025'),
                HomePortfolioItem(
                  imageUrl: 'assets/images/HenryMeds.jpg',
                  onTap: () {
                    launchDialog.call(
                      context: context,
                      name: 'Henry Meds',
                      links: [
                        'https://app.henrymeds.com/',
                      ],
                    );
                  },
                ),

                const HomeDate(date: '2023'),
                HomePortfolioItem(
                  imageUrl: 'assets/images/iConnections.jpg',
                  onTap: () {
                    launchDialog.call(
                      context: context,
                      name: 'iConnections',
                      links: [
                        'https://apps.apple.com/us/app/iconnections-llc/id1534676334',
                        'https://play.google.com/store/apps/details?id=io.iconnections.mobile'
                      ],
                    );
                  },
                ),
                const HomeDate(date: '2020'),
                HomePortfolioItem(
                  imageUrl: 'assets/images/meditation_experience.jpg',
                  onTap: () {
                    launchDialog.call(
                      context: context,
                      name: 'Meditation Experience',
                      links: [
                        'https://apps.apple.com/us/app/meditation-experience/id1399192121',
                        'https://play.google.com/store/apps/details?id=com.scottalanwilliams.meditationexperience'
                      ],
                    );
                  },
                ),
                const HomeDate(date: '2019'),
                HomePortfolioItem(
                  imageUrl: 'assets/images/3D_psy_art_creator.jpg',
                  onTap: () {
                    launchDialog.call(
                      context: context,
                      name: '3D Psy Art Creator',
                      links: [
                        'https://play.google.com/store/apps/details?id=com.ScottAlanWilliams.psyartcreator',
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
