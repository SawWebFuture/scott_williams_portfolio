import 'package:flutter/material.dart';
import 'package:mfe_home/widgets/widgets/home_empty_links.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class HomePortfolioDialog extends StatelessWidget {
  const HomePortfolioDialog({
    super.key,
    required this.name,
    required this.links,
  });

  final String name;
  final List<String> links;

  Future<void> urlLauncher({required String url}) async {
    final Uri urlParsed = Uri.parse(url);
    if (!await launchUrl(urlParsed)) {
      throw Exception('Could not launch $urlParsed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 13,
                    width: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 21.0, horizontal: 13),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 'no');
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(right: 13, top: 8),
                      child: const FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            links.isEmpty
                ? const HomeEmptyLinks()
                : Container(
                    height: 200,
                    width: 200,
                    padding: const EdgeInsets.only(top: 30),
                    child: ListView.builder(
                        itemCount: links.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              urlLauncher(url: links[index]);
                            },
                            child: index == 0
                                ? Image.asset('assets/images/google_play.jpg')
                                : Image.asset('assets/images/apple_store.jpg'),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
