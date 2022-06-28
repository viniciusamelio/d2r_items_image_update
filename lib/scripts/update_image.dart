import 'package:puppeteer/puppeteer.dart';

import '../models/item_model.dart';
import 'download_image.dart';
import 'upload_image.dart';

Future<void> updateItemImage(ItemModel item, Page page) async {
  try {
    await page.goto(
        "https://traderie.com/diablo2resurrected/products?search=${item.name}",
        wait: Until.load,
        timeout: Duration(
          seconds: 300,
        ));
    print("Navegou para a página do item ${item.name}");
    await page.waitForSelector(".search-content .item img");
    final imagePath = await page.$eval(
        ".search-content .item img", ' function (el) {return el.src;}');
    final imageFile = await downloadImage(imagePath, item.name);
    uploadImage(
      item: item,
      imageFile: imageFile,
    );
  } catch (e) {
    print(e);
  }
}
