import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Alasan pemilihan font dan gaya:
/// Plus Jakarta Sans dipilih karena hurufnya modern, bersih, dan mudah dibaca
/// di layar mobile, cocok untuk daftar menu kantin. Warna teks dibuat netral
/// (hitam) agar kontras dan tetap nyaman di berbagai ukuran layar.
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.plusJakartaSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}