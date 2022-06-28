import 'dart:io';

import 'package:http/http.dart';

Future<File> downloadImage(String imagePath, String itemName) async {
  try {
    final response = await get(Uri.parse(imagePath));
    final file = File("images/$itemName.png")
      ..writeAsBytesSync(response.bodyBytes);
    return file;
  } catch (e) {
    print(e);
    rethrow;
  }
}
