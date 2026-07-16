import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadImageService {
  final url = Uri.parse('https://api.cloudinary.com/v1_1/dndihenwf/upload');
  Future<String> uploadImage(String path) async {
    final request = http.MultipartRequest('POST', url);
    request.fields['upload_preset'] = 'appEcommerce';
    request.files.add(await http.MultipartFile.fromPath('file', path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);

      final url = jsonMap['url'];
      return url;
    } else {
      return '';
    }
  }

  Future<String> selectImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    String imagePath = image!.path;
    // uploadImage(image!.path);
    return imagePath;
  }
}
