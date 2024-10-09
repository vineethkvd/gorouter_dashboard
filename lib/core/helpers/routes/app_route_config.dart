import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/helpers/routes/app_route_name.dart';
import 'package:myapp/features/analytics/view/overview_page.dart';
import 'package:myapp/features/analytics/view/performance_page.dart';
import 'package:myapp/features/analytics/view/sales_page.dart';
import 'package:myapp/features/dashboard/view/dashboardPage.dart';
import 'package:myapp/features/reports/view/reportPage.dart';
import 'package:myapp/features/settings/view/settings.dart';
import 'app_route_path.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesPath.dashboard,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return DashboardPage(child: child); // Pass the child to the layout
        },
        routes: [
          GoRoute(
            name: RoutesName.dashboard,
            path: RoutesPath.dashboard,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const AnalyticsOverviewPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            name: RoutesName.overview,
            path: RoutesPath.overview,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const AnalyticsOverviewPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            name: RoutesName.sales,
            path: RoutesPath.sales,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const AnalyticsSalesPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            name: RoutesName.performance,
            path: RoutesPath.performance,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const AnalyticsPerformancePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            name: RoutesName.reports,
            path: RoutesPath.reports,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const ReportsPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          GoRoute(
            name: RoutesName.settings,
            path: RoutesPath.settings,
            pageBuilder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
              final name = state.pathParameters['name'] ?? '';
              return CustomTransitionPage<void>(
                key: state.pageKey,
                child: SettingsPage(id: id, name: name),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
        ],
      ),
    ],
  );
}
