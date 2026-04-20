import 'package:flutter/material.dart';
import 'alt_navigasyon.dart';

void main() {
  runApp(const Yemek_Tarifleri());
}

class Yemek_Tarifleri extends StatelessWidget {
  const Yemek_Tarifleri({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AltNavigasyon(),
      debugShowCheckedModeBanner: false,
    );
  }
}
