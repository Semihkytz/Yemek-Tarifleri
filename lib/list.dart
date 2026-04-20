import 'package:flutter/material.dart';
import 'tarif_detay.dart';

class ListOrnek extends StatefulWidget {
  const ListOrnek({super.key});

  @override
  State<ListOrnek> createState() => _ListOrnekState();
}

final TextEditingController _tarifKontrolcusu = TextEditingController();

class _ListOrnekState extends State<ListOrnek> {
  // 1. Veri listemiz
  List<String> tarifler = ['Mercimek Çorbası', 'Mantı', 'İmambayıldı'];

  // 2. Yeni tarif ekleme fonksiyonu
  void _yeniTarifEkle() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yeni Tarif Ekle'),
        content: TextField(
          controller: _tarifKontrolcusu,
          decoration: const InputDecoration(hintText: 'Tarif adını yazın...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              // Dialogu kapatıyoruz
              Navigator.pop(context);

              // setState'i buraya koymalıyız ki butona basınca listeye eklensin
              setState(() {
                if (_tarifKontrolcusu.text.isNotEmpty) {
                  tarifler.add(_tarifKontrolcusu.text);
                }
              });
              _tarifKontrolcusu.clear(); // text kutusunu temizliyoruz
            },
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
  }

  AppBar appbar = AppBar(
    title: const Text('Tariflerim'),
    centerTitle: true,
    backgroundColor: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      // 3. ListView artık listemizin uzunluğuna göre çalışıyor
      body: ListView.builder(
        itemCount: tarifler.length,
        itemBuilder: (context, index) {
          return Card(
            // Tasarım için ListTile'ı Card içine aldık
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.restaurant_menu, color: Colors.orange),
              title: Text(tarifler[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Yeni öğrenen mantığıyla if-else kullanarak resim, süre ve hazırlanış seçelim
                String secilenResimLink = "";
                String hazirlanmaSuresi = "";
                String hazirlanisi = "";

                if (tarifler[index] == 'Mercimek Çorbası') {
                  // Unsplash üzerinden engelsiz çorba resmi
                  secilenResimLink =
                      "https://images.unsplash.com/photo-1547592166-23ac45744acd?q=80&w=600&auto=format&fit=crop";
                  hazirlanmaSuresi = "30 Dakika";
                  hazirlanisi =
                      "Mercimekleri iyice yıkayın. Bir tencerede biraz yağ ile soğanı kavurun, ardından mercimek, su ve baharatları ekleyin. Mercimekler yumuşayana kadar kaynatın. En son blenderdan geçirerek pürüzsüz hale getirin. Üzerine tereyağlı nane yakarak servis yapabilirsiniz. Afiyet olsun!";
                } else if (tarifler[index] == 'Mantı') {
                  // Pexels üzerinden, kesintisiz çalışan bir mantı (hamur işi) resmi
                  secilenResimLink =
                      "https://images.pexels.com/photos/5409015/pexels-photo-5409015.jpeg?auto=compress&cs=tinysrgb&w=800";
                  hazirlanmaSuresi = "60 Dakika";
                  hazirlanisi =
                      "Hamuru yavaş yavaş yoğurun ve ince olacak şekilde açın. Küçük kareler halinde kesin ve ortalarına kıymalı harçtan koyun. Uçlarını birleştirerek kapatın. Kaynayan suda mantılar suyun yüzüne çıkana kadar haşlayın. Sarımsaklı yoğurt ve salçalı tereyağı sosu ile servis edin.";
                } else if (tarifler[index] == 'İmambayıldı') {
                  secilenResimLink =
                      "https://media.cumhuriyet.com.tr/Archive/942bcee9-7e31-4668-9dcc-05137e656255.jpg";
                  hazirlanmaSuresi = "45 Dakika";
                  hazirlanisi =
                      "Patlıcanları pijama şeklinde (alacalı) soyun ve hafifçe kızartın. Ayrı bir tavada zeytinyağında bol soğan, sarımsak, biber ve domatesi soteleyerek iç harcını hazırlayın. Patlıcanların ortasını yarıp bu harcı içine doldurun. Tencereye alıp yumuşayana kadar pişirin.";
                } else {
                  // Eğer yeni bir yemek eklendiyse
                  secilenResimLink =
                      "https://images.unsplash.com/photo-1490818387583-1b5422200259?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80";
                  hazirlanmaSuresi = "Belirtilmemiş";
                  hazirlanisi =
                      "Bu tarifin yapılışı henüz eklenmemiş. Kendi damak zevkinize göre hazırlayabilir ve afiyetle yiyebilirsiniz!";
                }

                // Navigator.push Kullanımı (Ödev gereksinimi)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TarifDetay(
                      tarifAdi: tarifler[index],
                      resimUrl: secilenResimLink,
                      hazirlanisi: hazirlanisi,
                      hazirlamaSuresi: hazirlanmaSuresi,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      // 4. Ekleme butonu
      floatingActionButton: FloatingActionButton(
        onPressed: _yeniTarifEkle,
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
        ), //burda beğeni butonu ekledim ama işlevsel değil :(
      ),
    );
  }
}
