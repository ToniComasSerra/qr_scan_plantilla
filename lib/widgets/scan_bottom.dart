import 'package:flutter/material.dart';

import '../models/scan_model.dart';
import '../providers/db_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () {
        print('Botó polsat!');
        ScanModel nouScan = ScanModel(valor: "https://paucasesnovescifp.cat");
        DBProvider.db.insertScan(nouScan);
      },
    );
  }
}
