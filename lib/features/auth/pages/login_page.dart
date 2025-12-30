import 'package:flutter/material.dart';
import 'package:fin_talk/core/constants/app_strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('login_scaffold'),
      appBar: AppBar(
        title: const Text(AppStrings.login),
      ),
      body: const Center(
        child: Text(AppStrings.loginPagePlaceholder),
      ),
    );
  }
}
