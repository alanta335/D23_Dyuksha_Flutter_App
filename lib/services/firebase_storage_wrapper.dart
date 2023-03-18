import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DyukshaFirebaseStorage {
  static Future<String> fetchDownloadURL(String url) async {
    print(url);
    String u=await FirebaseStorage.instance.ref().child(url).getDownloadURL();
   print(u);
    return await FirebaseStorage.instance.ref().child(url).getDownloadURL();
  }
}
