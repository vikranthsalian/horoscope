import 'dart:io';

import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareUtils {
  ShareUtils._();

  static onShareMsg(text) async {
    Share.share(text);
  }

  static onShareFiles(text) async {
    final bytes = await rootBundle.load(MetaFlavourConstants.flavorPath +
        MetaFlavourConstants.imagesPath +
        MetaFlavourConstants.shareAsset);
    final list = bytes.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(list);
    Share.shareXFiles([XFile(file.path)], text: text);
  }
}
