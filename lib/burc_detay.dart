import 'package:burc_rehberim/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required Burc this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.teal.shade100;
  late PaletteGenerator _generator;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBaraRenkAta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              toolbarTextStyle: TextStyle(fontFamily: "Comfort"),
              pinned: true,
              backgroundColor: appBarRengi,
              flexibleSpace: FlexibleSpaceBar(
                title:
                    Text((widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"), style: TextStyle(fontFamily: "Comfort"),),
                centerTitle: true,
                background: Image.asset(
                  "images/" + widget.secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  color: appBarRengi, 
                  //margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView( 
                    child: Text(widget.secilenBurc.burcDetayi, style: TextStyle(fontFamily: "Comfort", color: Colors.white, fontSize: 20),), 
                  
                  )),
            )
          ],
        ));
  }

  void appBaraRenkAta() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/" + widget.secilenBurc.burcBuyukResim));
    appBarRengi = _generator.vibrantColor!.color;
    setState(() {
      
    });
  }
}
