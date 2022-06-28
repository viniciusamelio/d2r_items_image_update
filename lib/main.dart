import 'package:d2r_items_image_update/models/item_model.dart';
import 'package:puppeteer/puppeteer.dart';

import 'database.dart';
import 'scripts/update_image.dart';

void main() async {
  try {
    final client = await initMongoDb();
    final collection = client.collection("Item");
    final jsonItems = await collection.find().toList();
    final items = jsonItems.map((value) => ItemModel.fromJson(value)).toList()
      ..reversed.toList();
    final browser = await puppeteer.launch(
      headless: true,
      args: ["--no-sandbox"],
    );
    final page = await browser.newPage();
    for (var item in items) {
      await updateItemImage(item, page);
    }

    browser.close();
  } catch (e) {
    print(e);
    rethrow;
  }
}
