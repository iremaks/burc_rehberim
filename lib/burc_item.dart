import 'package:burc_rehberim/burc_detay.dart';
import 'package:flutter/material.dart';

import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
                ),
              );
            },
            leading: Image.asset("images/" + listelenenBurc.burcKucukResim),
            title: Text(
              listelenenBurc.burcAdi,
              style: TextStyle(
                  fontFamily: "Comforter",
                  color: Colors.white,
                  fontSize: 29,
                  backgroundColor: Colors.teal,
                  ),
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: TextStyle(fontFamily: "Comforter", fontSize: 19),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
