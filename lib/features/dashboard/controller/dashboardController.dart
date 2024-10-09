import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/routes/app_route_name.dart';
import 'package:myapp/core/helpers/routes/app_route_path.dart';
import 'package:myapp/features/dashboard/model/dashboardModel.dart';

class DashboardController extends ChangeNotifier {
  bool isSidebarOpen = true;

  void toggleSidebar() {
    isSidebarOpen = !isSidebarOpen;
    notifyListeners();
  }

  final List<DashboardItem> _items = [
    DashboardItem(
      title: RoutesName.analytics,
      icon: Icons.analytics,
      route: RoutesPath.analytics,
    ),
    DashboardItem(
      title: RoutesName.reports,
      icon: Icons.pie_chart,
      route: RoutesPath.reports,
    ),
    DashboardItem(
      title: RoutesName.settings,
      icon: Icons.settings,
      route: RoutesPath.settings,
    ),
  ];

  List<DashboardItem> get items => _items;
}
