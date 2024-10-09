import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/helpers/routes/app_route_name.dart';
import 'package:myapp/core/helpers/routes/app_route_path.dart';
import 'package:myapp/features/dashboard/controller/dashboardController.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  final Widget? child; // Made nullable to handle null cases
  const DashboardPage({super.key, this.child});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile =
            constraints.maxWidth < 800; // Define mobile breakpoint
        return Scaffold(
          appBar: isMobile
              ? AppBar(
                  title: const Text("Modern Dashboard"),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.menu), // Menu button for mobile
                      onPressed: () {
                        Scaffold.of(context).openDrawer(); // Open Drawer on tap
                      },
                    ),
                  ],
                )
              : null, // Hide AppBar on larger screens
          drawer:
              isMobile ? const DashboardDrawer() : null, // Drawer for mobile
          body: Row(
            children: [
              if (!isMobile)
                const Expanded(
                  flex: 2,
                  child: DashboardMenu(), // Sidebar for larger screens
                ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: widget.child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Sidebar Menu for larger screens
class DashboardMenu extends StatelessWidget {
  const DashboardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardController>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: dashboardProvider.items.length,
        itemBuilder: (context, index) {
          final item = dashboardProvider.items[index];

          // Check if the current item is 'Analytics' to display ExpansionTile
          if (item.title == RoutesName.analytics) {
            return Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent, // Remove splash effect
                highlightColor: Colors.transparent,
              ),
              child: ExpansionTile(
                leading: Icon(item.icon, color: Colors.white),
                title: Text(item.title,
                    style: const TextStyle(color: Colors.white)),
                iconColor: Colors.white,
                childrenPadding: const EdgeInsets.only(left: 20),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.dashboard, color: Colors.white),
                    title: const Text('Overview',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => context.go(RoutesPath.overview),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.attach_money, color: Colors.white),
                    title: const Text('Sales',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => context.go(RoutesPath.sales),
                  ),
                  ListTile(
                    leading: const Icon(Icons.show_chart, color: Colors.white),
                    title: const Text('Performance',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => context.go(RoutesPath.performance),
                  ),
                ],
              ),
            );
          }

          // For other dashboard items
          return Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ListTile(
              leading: Icon(item.icon, color: Colors.white),
              title:
                  Text(item.title, style: const TextStyle(color: Colors.white)),
              onTap: () {
                if (item.title == 'settings') {
                  GoRouter.of(context).goNamed(
                    RoutesName.settings,
                    pathParameters: {
                      'id': '123', 
                      'name': 'John Doe',
                    },
                  );
                } else {
                  context.go(item.route);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

// Drawer Menu for mobile screens
class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardController>(context);

    return Drawer(
      child: Container(
        color: Colors.blue.shade900,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemCount: dashboardProvider.items.length,
          itemBuilder: (context, index) {
            final item = dashboardProvider.items[index];

            if (item.title == RoutesName.analytics) {
              return ExpansionTile(
                leading: Icon(item.icon, color: Colors.white),
                title: Text(item.title,
                    style: const TextStyle(color: Colors.white)),
                childrenPadding: const EdgeInsets.only(left: 20),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.dashboard, color: Colors.white),
                    title: const Text('Overview',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => context.go(RoutesPath.overview),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.attach_money, color: Colors.white),
                    title: const Text('Sales',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => context.go(RoutesPath.sales),
                  ),
                  ListTile(
                    leading: const Icon(Icons.show_chart, color: Colors.white),
                    title: const Text('Performance',
                        style: TextStyle(color: Colors.white)),
                    onTap: () => context.go(RoutesPath.performance),
                  ),
                ],
              );
            }

            // Other items
            return ListTile(
              leading: Icon(item.icon, color: Colors.white),
              title:
                  Text(item.title, style: const TextStyle(color: Colors.white)),
              onTap: () {
                context.go(item.route);
              },
            );
          },
        ),
      ),
    );
  }
}
