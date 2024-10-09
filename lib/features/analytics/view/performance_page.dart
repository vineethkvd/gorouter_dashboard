import 'package:flutter/material.dart';

class AnalyticsPerformancePage extends StatefulWidget {
  const AnalyticsPerformancePage({super.key});

  @override
  State<AnalyticsPerformancePage> createState() => _AnalyticsPerformancePageState();
}

class _AnalyticsPerformancePageState extends State<AnalyticsPerformancePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Analytics Performance Page", style: TextStyle(fontSize: 24)),
    );
  }
}