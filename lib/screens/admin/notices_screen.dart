import 'package:flutter/material.dart';

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Notices')),
      body: const Center(child: Text('Notices system coming soon')),
    );
  }
}
