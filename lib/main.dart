import 'package:app_restaurante/providers/ui_provider.dart';
import 'package:app_restaurante/router/router.dart';
import 'package:app_restaurante/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UiProvider(),),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: RoutesList.initialRoute,
          routes: RoutesList.getAppRoutes(),
          theme: AppTheme.lightTheme,
          onGenerateRoute: RoutesList.onGeneratedRoute),
    );
  }
}
