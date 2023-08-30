import 'package:advanced_todo_list/common/utils/constants.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/onboarding/pages/onboarding.dart';
import 'features/todo/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
      brightness: Brightness.dark, primarySwatch: Colors.blue);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(
            builder: (lightColorScheme, darkColorScheme) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    scaffoldBackgroundColor: AppConst.kbkDark,
                    colorScheme: lightColorScheme ?? defaultLightColorScheme,
                    useMaterial3: true),
                darkTheme: ThemeData(
                    scaffoldBackgroundColor: AppConst.kbkDark,
                    colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                    useMaterial3: true),
                themeMode: ThemeMode.dark,
                home: HomePage(),
              );
            },
          );
        });
  }
}
