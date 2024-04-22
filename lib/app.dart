import 'package:explore_ease/bindings/general_bindings.dart';
import 'package:explore_ease/utils/constants/colors.dart';
import 'package:explore_ease/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: EEAppTheme.lightTheme,
      darkTheme: EEAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: EEColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: EEColors.white),
        ),
      ),
    );
  }
}
