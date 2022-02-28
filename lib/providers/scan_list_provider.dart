import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/providers/providers.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipusSeleccionat = 'http';

  Future<ScanModel> nouScan(String valor) async {
    final nouScan = ScanModel(valor: valor);
    final id = await DBProvider.db.insertScan(nouScan);
    nouScan.id = id;

    if(nouScan.tipus == tipusSeleccionat) {
      scans.add(nouScan);
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
    scans = [...scansPerTipus];
    tipusSeleccionat = tipus;
    notifyListeners();
  }

  esborraTots() async {
    final esborraScans = await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  esborraPerId(int id) async {
    final esborraScanPerId = await DBProvider.db.deleteScan(id);
    notifyListeners();
  }
}