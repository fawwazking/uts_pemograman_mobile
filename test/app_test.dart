import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kantin_menu/main.dart';
import 'package:kantin_menu/widgets/custom_text.dart';

void main() {
  testWidgets('Aplikasi merender halaman daftar menu dan widget utama',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify CustomText instances are present
    expect(find.byType(CustomText), findsWidgets);
    expect(find.text('Menu Kantin'), findsOneWidget);
    expect(find.text('Daftar Menu'), findsOneWidget);

    // Verify initial menus exist
    expect(find.text('Nasi Goreng'), findsOneWidget);
    expect(find.text('Rp 15000'), findsOneWidget);

    // Verify FloatingActionButton exists
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Tap an item opens detail page
    await tester.tap(find.text('Nasi Goreng'));
    await tester.pumpAndSettle();
    expect(find.text('Detail Menu'), findsOneWidget);
    expect(find.text('Rp 15000'), findsOneWidget);

    // Back to list via system back / Get.back()
    final NavigatorState nav = tester.state(find.byType(Navigator));
    nav.pop();
    await tester.pumpAndSettle();
    expect(find.text('Daftar Menu'), findsOneWidget);

    // FAB opens add page
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Tambah Menu'), findsOneWidget);

    // Submit empty form -> validation errors appear
    await tester.tap(find.text('Simpan'));
    await tester.pump();
    expect(find.text('Nama menu tidak boleh kosong'), findsOneWidget);
    expect(find.text('Harga tidak boleh kosong'), findsOneWidget);

    // Invalid price -> numeric validation error
    await tester.enterText(find.byType(TextFormField).at(0), 'Ayam Geprek');
    await tester.enterText(find.byType(TextFormField).at(1), 'seribu');
    await tester.tap(find.text('Simpan'));
    await tester.pump();
    expect(find.text('Harga harus berupa angka'), findsOneWidget);

    // Valid input -> returns to list with new entry
    await tester
        .enterText(find.byType(TextFormField).at(0), 'Ayam Geprek');
    await tester.enterText(find.byType(TextFormField).at(1), '20000');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();
    expect(find.text('Daftar Menu'), findsOneWidget);
    expect(find.text('Ayam Geprek'), findsOneWidget);
    expect(find.text('Rp 20000'), findsOneWidget);
  });
}