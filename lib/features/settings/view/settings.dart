import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final int id;
  final String name;

  const SettingsPage({super.key, required this.id, required this.name});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Settings Page - ID: ${widget.id}, Name: ${widget.name}",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

