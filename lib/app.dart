import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/routes/app_route_config.dart';
import 'package:myapp/features/dashboard/controller/dashboardController.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardController(),
        ),
       
      ],
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: AppRoutes.router.routerDelegate,
          routeInformationParser: AppRoutes.router.routeInformationParser,
          routeInformationProvider: AppRoutes.router.routeInformationProvider,
        );
      },
    );
  }
}