import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SettingsView extends GetView {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Em construção',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
