import 'dart:developer';
import 'dart:io';

import 'package:adithya_horoscope/core/utils/calculate.dart';
import 'package:adithya_horoscope/domain/model/bhava_sandhi_model.dart';
import 'package:adithya_horoscope/domain/model/horoscope_model.dart';
import 'package:adithya_horoscope/domain/model/shadvarga_model.dart';
import 'package:cr_file_saver/file_saver.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class MetaPdf {
  HoroscopeModel? hm;

  write(HoroscopeModel h, ctrs) async {
    hm = h;
    //Create a new PDF document
    PdfDocument document = PdfDocument();

    await createBasic(document);

    await createRashiKundli(document, ctrs['ctr1']);

    await createPanchanga(document);
//locked
    await createPlanetInfo(document);

    await createBhavaSandhi(document);

    await createDashaBhukthi(document);

    await createShadvarga(document);

    await createAshtakavarga(document);

    await createTrisphutadi(document);

    await createDhoomadi(document);
    //  return;
    String fileName = "aditya-${DateTime.now().microsecondsSinceEpoch}";

    List<int> bt = await document.save();
    // _createFolder();
    final folder = await getTemporaryDirectory();
    final filePath = '${folder.path}/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(bt);

    try {
      final qw = await CRFileSaver.saveFile(
        filePath,
        destinationFileName: '$fileName.pdf',
      );
      log('Saved to $qw');
    } on PlatformException catch (e) {
      log('file saving error: ${e.code}');
    }
  }

  createBasic(PdfDocument document) {
    String page =
        "name  :  ${hm!.name!}\ndate_of_birth  :  ${hm!.dob!}\ntime  :  ${hm!.tob!}\nbirth_place  :  ${hm!.place!}\ntime_zone  :  ${hm!.getTimezone!}\nlatitude  :  ${hm!.getLatitude!}\nlongitude  :  ${hm!.getLongitude!}\nkalidina  :  ${hm!.kalidin}\nsunrise  :  ${hm!.getSunrise!}\nsunset  :  ${hm!.getSunset!}\nudayadi  :  ${HoroScopeUtils().getMetaUdayadi(HoroScopeUtils().getMetaTimeOfBirth(hm!.tob), hm!.sunriseValue)}";
    print("========>createBasic");
    print(page);
    PdfUnorderedList(
            text: page,
            style: PdfUnorderedMarkerStyle.disk,
            font: PdfStandardFont(PdfFontFamily.helvetica, 15),
            indent: 10,
            textIndent: 10,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: document.pages.add(), bounds: Rect.fromLTWH(0, 10, 0, 0));
  }

  createRashiKundli(PdfDocument document, ScreenshotController ctr) async {
    String pagedata = "name  :  ${hm!.name!}\n"
        "date_of_birth  :  ${hm!.dob!}\n"
        "nakshathra  :  ${HoroScopeUtils().getMetaNakshatra(hm!.chandraValue!)}";

    print("========>createRashiKundli");
    print(pagedata);

    PdfPage page = document.pages.add();

    PdfUnorderedList(
            text: pagedata,
            style: PdfUnorderedMarkerStyle.disk,
            font: PdfStandardFont(PdfFontFamily.helvetica, 15),
            indent: 10,
            textIndent: 10,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: page, bounds: Rect.fromLTWH(0, 10, 0, 0));

    File file = await takeScreenshot(ctr);

    //Draw the image
    page.graphics.drawImage(
        PdfBitmap(file.readAsBytesSync()),
        Rect.fromLTWH(
            0, 0, page.getClientSize().width, page.getClientSize().height));

    return;
  }

  createPanchanga(PdfDocument document) {
    List<(String, String)> list =
        HoroScopeUtils().getMetaPanchangaValues(hm!) ?? [];
    String page = "";

    for (var (index, item) in list.indexed) {
      page =
          "$page${item.$1}  :  ${item.$2}${(index != list.length - 1) ? "\n" : ""}";
    }
    print("========>createPanchanga");
    print(page);

    PdfUnorderedList(
            text: page,
            style: PdfUnorderedMarkerStyle.disk,
            font: PdfStandardFont(PdfFontFamily.helvetica, 15),
            indent: 10,
            textIndent: 10,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: document.pages.add(), bounds: Rect.fromLTWH(0, 10, 0, 0));
  }

  createPlanetInfo(PdfDocument document) {
    //Create a PdfGrid class
    PdfGrid grid = PdfGrid();
    //Add the columns to the grid
    grid.columns.add(count: 4);

    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'planet';
    header.cells[1].value = 'longitude';
    header.cells[2].value = 'nakshathra';
    header.cells[3].value = 'pada';

    //Add rows to grid
    PdfGridRow? row = grid.rows.add();
    for (var (index, item) in hm!.grahaSputhaValues!.indexed) {
      if (index != 0) {
        row = grid.rows.add();
      }

      row!.cells[0].value = item.planet;
      row.cells[1].value = item.longitude;
      row.cells[2].value = item.nakshathra;
      row.cells[3].value = item.pada;
    }

    //Set the grid style
    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
        backgroundBrush: PdfBrushes.white,
        textBrush: PdfBrushes.black,
        font: PdfStandardFont(PdfFontFamily.timesRoman, 20));

//Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    return;
  }

  createBhavaSandhi(PdfDocument document) {
    //Create a PdfGrid class
    PdfGrid grid = PdfGrid();
    //Add the columns to the grid
    grid.columns.add(count: 3);

    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'bhava';
    header.cells[1].value = 'madhya';
    header.cells[2].value = 'anthya';

    //Add rows to grid
    List<BhavaSandhiModel> list = HoroScopeUtils()
        .getMetaBhavasandhiValues(hm!.lagnaValue, hm!.dasamaValue);
    PdfGridRow? row = grid.rows.add();
    for (var (index, item) in list.indexed) {
      if (index != 0) {
        row = grid.rows.add();
      }

      row!.cells[0].value = item.bhava;
      row.cells[1].value = item.madhya;
      row.cells[2].value = item.anthya;
    }

    //Set the grid style
    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
        backgroundBrush: PdfBrushes.white,
        textBrush: PdfBrushes.black,
        font: PdfStandardFont(PdfFontFamily.timesRoman, 20));

//Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    return;
  }

  createDashaBhukthi(PdfDocument document) {
    List<(String, String)> list =
        HoroScopeUtils().getMeta9DasaBhuktiValues(hm!) ?? [];
    String page = "";

    for (var (index, item) in list.indexed) {
      page =
          "$page${item.$1}  :  ${item.$2}${(index != list.length - 1) ? "\n" : ""}";
    }
    print("========>createDashaBhukthi");
    print(page);

    PdfUnorderedList(
            text: page,
            style: PdfUnorderedMarkerStyle.disk,
            font: PdfStandardFont(PdfFontFamily.helvetica, 15),
            indent: 10,
            textIndent: 10,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: document.pages.add(), bounds: Rect.fromLTWH(0, 10, 0, 0));
  }

  createShadvarga(PdfDocument document) {
    //Create a PdfGrid class
    PdfGrid grid = PdfGrid();
    //Add the columns to the grid
    grid.columns.add(count: 7);

    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'graha';
    header.cells[1].value = 'dre';
    header.cells[2].value = 'hor';
    header.cells[3].value = 'nav';
    header.cells[4].value = 'tri';
    header.cells[5].value = 'dwa';
    header.cells[6].value = 'ksh';

    //Add rows to grid
    List<ShadVargaModel> list = HoroScopeUtils().getMetaShadvargaValues(hm!);
    PdfGridRow? row = grid.rows.add();
    for (var (index, item) in list.indexed) {
      if (index != 0) {
        row = grid.rows.add();
      }

      row!.cells[0].value = item.graha;
      row.cells[1].value = item.dre;
      row.cells[2].value = item.hor;
      row.cells[3].value = item.nav;
      row.cells[4].value = item.tri;
      row.cells[5].value = item.dwa;
      row.cells[6].value = item.ksh;
    }

    //Set the grid style
    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
        backgroundBrush: PdfBrushes.white,
        textBrush: PdfBrushes.black,
        font: PdfStandardFont(PdfFontFamily.timesRoman, 20));

//Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    return;
  }

  createAshtakavarga(PdfDocument document) {
    //Create a PdfGrid class
    PdfGrid grid = PdfGrid();
    //Add the columns to the grid
    grid.columns.add(count: 9);

    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'rasi';
    header.cells[1].value = 'rv';
    header.cells[2].value = 'ch';
    header.cells[3].value = 'kj';
    header.cells[4].value = 'bd';
    header.cells[5].value = 'gr';
    header.cells[6].value = 'sk';
    header.cells[7].value = 'sn';
    header.cells[8].value = 'sarv';

    //Add rows to grid
    List<List<int>> list = HoroScopeUtils().getMetaAshtakaVargaValues(hm!);
    PdfGridRow? row = grid.rows.add();
    for (var (index, item) in list.indexed) {
      print(item);
      if (index != 0) {
        row = grid.rows.add();
      }

      row!.cells[0].value = item[0].toString();
      row.cells[1].value = item[1].toString();
      row.cells[2].value = item[2].toString();
      row.cells[3].value = item[3].toString();
      row.cells[4].value = item[4].toString();
      row.cells[5].value = item[5].toString();
      row.cells[6].value = item[6].toString();
      row.cells[7].value = item[7].toString();
      row.cells[8].value = item[8].toString();

      print(row.cells.count);
    }

    //Set the grid style
    grid.style = PdfGridStyle(
        cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
        backgroundBrush: PdfBrushes.white,
        textBrush: PdfBrushes.black,
        font: PdfStandardFont(PdfFontFamily.timesRoman, 20));

//Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    return;
  }

  createTrisphutadi(PdfDocument document) {
    List<(String, String)> list =
        HoroScopeUtils().getMetaTrisphutadiValues(hm!) ?? [];
    String page = "";

    for (var (index, item) in list.indexed) {
      page =
          "$page${item.$1}  :  ${item.$2}${(index != list.length - 1) ? "\n" : ""}";
    }
    print("========>createTrisphutadi");
    print(page);

    PdfUnorderedList(
            text: page,
            style: PdfUnorderedMarkerStyle.disk,
            font: PdfStandardFont(PdfFontFamily.helvetica, 15),
            indent: 10,
            textIndent: 10,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: document.pages.add(), bounds: Rect.fromLTWH(0, 10, 0, 0));
  }

  createDhoomadi(PdfDocument document) {
    List<(String, String)> list =
        HoroScopeUtils().getMetaDhoomadiValues(hm!) ?? [];
    String page = "";

    for (var (index, item) in list.indexed) {
      page =
          "$page${item.$1}  :  ${item.$2}${(index != list.length - 1) ? "\n" : ""}";
    }
    print("========>createDhoomadi");
    print(page);

    PdfUnorderedList(
            text: page,
            style: PdfUnorderedMarkerStyle.disk,
            font: PdfStandardFont(PdfFontFamily.helvetica, 15),
            indent: 10,
            textIndent: 10,
            format: PdfStringFormat(lineSpacing: 10))
        .draw(page: document.pages.add(), bounds: Rect.fromLTWH(0, 10, 0, 0));
  }

  takeScreenshot(screenshotController) async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List? image) async {
      print("screenshotController");
      print(image);
      if (image != null) {
        String fileName = DateTime.now().microsecondsSinceEpoch.toString();
        final directory = await getApplicationDocumentsDirectory();
        File file = await File('${directory.path}/${fileName}.png');
        await file.writeAsBytes(image);
        return file;
      }
    });
  }

  // _createFolder() async {
  //   final folder = await getTemporaryDirectory();
  //   final folderName = "adithya";
  //   final path = Directory("${folder.path}/$folderName");
  //   if ((await path.exists())) {
  //     // TODO:
  //     print("exist");
  //   } else {
  //     // TODO:
  //     print("not exist");
  //     path.create();
  //   }
  //   return path;
  // }
}
