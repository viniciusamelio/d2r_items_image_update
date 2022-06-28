import 'package:dotenv/dotenv.dart';

var env = DotEnv(includePlatformEnvironment: true)..load();

class Env {
  static String supabaseUrl = env["SUPABASE_URL"]!;
  static String supaseKey = env["SUPABASE_KEY"]!;
  static String mongoDBConnection = env["DB_CONNECTION_STRING"]!;
}
