import 'package:burc_rehberim/burc_item.dart';
import 'package:flutter/material.dart';
import 'package:burc_rehberim/model/burc.dart';
import 'package:burc_rehberim/data/strings.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynagiHazirla();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("B u r ç l a r   L i s t e s i"), titleTextStyle: TextStyle(fontFamily: "Comforter", fontSize: 35
        ),),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return BurcItem(listelenenBurc: tumBurclar[index],);
            },
            itemCount: tumBurclar.length,
          ),
        ));
  }

  List<Burc> veriKaynagiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarihi, burcDetayi, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
