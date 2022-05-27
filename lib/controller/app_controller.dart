import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AppController extends GetxController {
  var uri = Uri.parse("http://192.168.1.10:8000/api/hehe");
  late XFile imagePath;
  final ImagePicker imagePicker = ImagePicker();

  openGal() async {
    imagePath = (await imagePicker.pickImage(source: ImageSource.gallery))!;
    print(imagePath.readAsBytes());
  }

  sendPost() async {
    var lengh = imagePath.path;
    var request = new http.MultipartRequest("POST", uri);
    request.files.add(
      await http.MultipartFile.fromPath("i", lengh),
    );
    var ress = await request.send();

    print(ress.statusCode);
    ress.stream.transform(utf8.decoder).listen((event) {
      print(event);
    });
  }

  check() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.10:8000/api/zz'));
    print(response.body);
  }
}
