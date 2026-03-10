import 'package:supabase_flutter/supabase_flutter.dart';

class StorageController {
  final supabase = Supabase.instance.client;
  String getImageUrl(String imageName) {
    final String publicUrl = supabase.storage
        .from('images')
        .getPublicUrl(imageName);

    return publicUrl;
  }
}
