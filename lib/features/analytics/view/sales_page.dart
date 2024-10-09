import 'package:flutter/material.dart';

class AnalyticsSalesPage extends StatefulWidget {
  const AnalyticsSalesPage({super.key});

  @override
  State<AnalyticsSalesPage> createState() => _AnalyticsSalesPageState();
}

class _AnalyticsSalesPageState extends State<AnalyticsSalesPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Analytics Sales Page", style: TextStyle(fontSize: 24)),
    );
  }
}
