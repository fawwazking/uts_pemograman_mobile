import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu.dart';
import '../widgets/custom_text.dart';

class DetailMenuPage extends StatelessWidget {
  final Menu menu;

  const DetailMenuPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Detail Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.fastfood, size: 80, color: Colors.teal),
              const SizedBox(height: 16),
              CustomText(
                text: menu.name,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: 'Rp ${menu.price}',
                fontSize: 18,
                color: Colors.grey[700] ?? Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}