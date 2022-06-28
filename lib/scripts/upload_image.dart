import 'dart:io';

import 'package:supabase/supabase.dart';

import '../env.dart';
import '../models/item_model.dart';

Future<void> uploadImage(
    {required ItemModel item, required File imageFile}) async {
  final folderName = item.src == "misc" ? "misc" : "${item.type}s";
  print("/$folderName/${item.name}.png");
  final client = SupabaseClient(Env.supabaseUrl, Env.supaseKey);
  final response = await client.storage
      .from("d2-items")
      .upload("$folderName/${item.name.replaceAll(" ", "_")}.png", imageFile);
  print(response.data ?? response.error);
}
