import 'package:app_restaurante/providers/theme_provider.dart';
import 'package:app_restaurante/router/router.dart';
import 'package:app_restaurante/shared_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: RoutesList.initialRoute,
        routes: RoutesList.getAppRoutes(),
        theme: Provider.of<ThemeProvider>(context).currentTheme,
        onGenerateRoute: RoutesList.onGeneratedRoute);
  }
}
