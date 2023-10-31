import 'package:flutter/cupertino.dart';
import 'package:scott_williams_portfolio/presentation/notifiers/main_state.dart';

class MainNotifier extends ValueNotifier<MainState> {
  MainNotifier()
      : super(
          MainState(status: MainStatus.login),
        );

  void changeStatus({required MainStatus status, String? name}) {
    value = value.copyWith(
      status: status,
      name: name ?? value.name,
    );
  }
}
