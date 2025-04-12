import 'package:flutter/material.dart';
import 'package:scott_williams_portfolio/presentation/widgets/user_name_dialog/user_name_dialog_field.dart';
import 'package:sw_dependencies/sw_dependencies.dart';

class UserNameDialog extends StatelessWidget {
  const UserNameDialog({super.key});

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
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 21.0, horizontal: 13),
                    child: Text(
                      'Create a User Name',
                      style: TextStyle(
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
            const UserNameDialogField(),
          ],
        ),
      ),
    );
  }
}
