import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_scan/models/scan_model.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if(scan.tipus == 'http') {
    if (!await launch(url)) throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}