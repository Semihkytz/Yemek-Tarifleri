import 'package:flutter/material.dart';
import 'AnaSayfa.dart';
import 'list.dart';

class AltNavigasyon extends StatefulWidget {
  const AltNavigasyon({super.key});

  @override
  State<AltNavigasyon> createState() => _AltNavigasyonState();
}

class _AltNavigasyonState extends State<AltNavigasyon> {
  int _currentIndex = 0;
  final List<Widget> _sayfalar = [
    const AnaSayfa(), // İçerik olan ana sayfa
    const ListOrnek(), // Tarif listeleri
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sayfalar[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tarifler"),
        ],
      ),
    );
  }
}
