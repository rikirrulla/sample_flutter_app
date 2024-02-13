import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:go_router/go_router.dart';

class StartupViewModel extends BaseViewModel {
  final BuildContext context;

  StartupViewModel(this.context);

  Future runStartupLogic() async {
    await Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      GoRouter.of(context).go('/home');
    });
  }
}
