import 'dart:io';

import 'package:dio/dio.dart';

class FileUtils {
  uploadFile(File file, Map<String, dynamic> map, key) async {
    String fileName = file.path.split('/').last;
    MultipartFile mFile =
        await MultipartFile.fromFile(file.path, filename: fileName);
    map[key] = mFile;
    FormData formData = FormData.fromMap(map);
    return formData;
  }

  uploadMultiFile(List<File> files, Map<String, dynamic> map, key) async {
    for (var (index, file) in files.indexed) {
      String fileName = file.path.split('/').last;
      MultipartFile mFile =
          await MultipartFile.fromFile(file.path, filename: fileName);
      map[key + "[$index]"] = mFile;
    }
    FormData formData = FormData.fromMap(map);
    return formData;
  }
}
