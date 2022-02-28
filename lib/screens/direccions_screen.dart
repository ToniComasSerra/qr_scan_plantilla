import 'package:flutter/material.dart';
import 'package:qr_scan/widgets/widgets.dart';

class DireccionsScreen extends StatelessWidget {
  const DireccionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipus: 'http');
  }
}
