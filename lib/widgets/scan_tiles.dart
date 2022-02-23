import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key, required this.tipus}) : super(key: key);
  final String tipus;

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_,index) => ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text(scans[index].valor),
        subtitle: Text(scans[index].id.toString()),
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
        onTap: (){
          
        },
      ),
    );
  }
}