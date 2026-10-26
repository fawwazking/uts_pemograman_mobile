import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/menu.dart';
import '../widgets/custom_text.dart';
import 'add_menu_page.dart';
import 'detail_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Menu> menus = [
    Menu(name: 'Nasi Goreng', price: 15000),
    Menu(name: 'Mie Ayam', price: 12000),
    Menu(name: 'Sate Ayam', price: 18000),
    Menu(name: 'Bakso', price: 10000),
    Menu(name: 'Es Teh Manis', price: 5000),
  ];

  void _openAddMenu() async {
    final newMenu = await Get.to(() => const AddMenuPage());
    if (newMenu is Menu) {
      setState(() {
        menus.add(newMenu);
      });
    }
  }

  void _openDetail(Menu menu) {
    Get.to(() => DetailMenuPage(menu: menu));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Menu Kantin',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomText(
              text: 'Daftar Menu',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: const Icon(Icons.fastfood, color: Colors.teal),
                    title: CustomText(
                      text: menu.name,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    subtitle: CustomText(
                      text: 'Rp ${menu.price}',
                      fontSize: 14,
                      color: Colors.grey[600] ?? Colors.grey,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _openDetail(menu),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: _openAddMenu,
        tooltip: 'Tambah Menu',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}