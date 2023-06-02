import 'package:flutter/material.dart';
import 'package:grocery_shop/constants/theme_data.dart';
import 'package:grocery_shop/providers/dark_theme_provider.dart';
import 'package:grocery_shop/screens/botm_bar.dart';
import 'package:grocery_shop/screens/home_screen.dart';
import 'package:grocery_shop/services/dark_theme_prefs.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  DarkThemeProvider themeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.setDarkTheme = await themeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: BottomBarScreen());
      }),
    );
  }
}
