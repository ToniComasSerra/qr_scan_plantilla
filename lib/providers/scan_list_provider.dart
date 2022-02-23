import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipusSeleccionat = 'http';

  Future<ScanModel> nouScan(String valor) async {
    final nouScan = ScanModel(valor: valor);
    final id = await DBProvider.db.insertScan(nouScan);
    nouScan.id = id;

    if(nouScan.tipus == tipusSeleccionat) {
      this.scans.add(nouScan);
      notifyListeners();
    }
    return nouScan;
  }

  carregaScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  carregaScansPerTipus(String tipus) async {
    final scansPerTipus = await DBProvider.db.getScanByTipus(tipus);
    this.scans = [...scansPerTipus];
    notifyListeners();
  }

  esborraTots() async {
    /*final esborraScans = await DBProvider.db.deleteAllScans();
    scans = [...esborraScans];
    notifyListeners();*/
  }

  esborraPerId(int id) async {
    
  }
}