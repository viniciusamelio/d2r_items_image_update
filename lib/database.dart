import 'package:d2r_items_image_update/env.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Db> initMongoDb() async {
  final db = await Db.create(Env.mongoDBConnection);
  await db.open(secure: true);
  return db;
}
