import 'package:flutter/material.dart';

class UserNameDialogField extends StatefulWidget {
  const UserNameDialogField({super.key});

  @override
  State<UserNameDialogField> createState() => _UserNameDialogFieldState();
}

class _UserNameDialogFieldState extends State<UserNameDialogField> {
  late final TextEditingController _controller;
  String value = '';
  String? errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Username',
                errorText: errorText,
              ),
              onChanged: (value) {
                if (errorText != null) {
                  setState(() {
                    errorText = null;
                  });
                }
              },
              autofocus: true,
            ),
          ),
          MaterialButton(
            onPressed: () {
              if (_controller.text == '') {
                setState(() {
                  errorText = 'Username is required';
                });
              } else {
                //TODO: update using hive
                Navigator.pop(context, _controller.text);
              }
            },
            child: const Text('Submit'),
          ),
          const SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}
