import 'package:flutter/material.dart';

class TarifDetay extends StatelessWidget {
  final String tarifAdi;
  final String resimUrl;
  final String hazirlanisi;
  final String hazirlamaSuresi;

  const TarifDetay({
    super.key,
    required this.tarifAdi,
    required this.resimUrl,
    required this.hazirlanisi,
    required this.hazirlamaSuresi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tarifAdi)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Widget Kullanımı
            Image.network(
              resimUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text ve Row Kullanımı
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tarifAdi,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.favorite_border, color: Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Container Kullanımı
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Hazırlama Süresi: $hazirlamaSuresi"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Yapılışı:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(hazirlanisi, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
