import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_video_picker/controller/app_controller.dart';

void main() {
  return runApp(
    GetMaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  AppController appController = Get.put(AppController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                appController.openGal();
              },
              child: Text("Get Image"),
            ),
            ElevatedButton(
              onPressed: () {
                appController.sendPost();
              },
              child: Text("Upload Image"),
            ),
            ElevatedButton(
              onPressed: () {
                appController.check();
              },
              child: Text("Upload Image"),
            )
          ],
        ),
      ),
    );
  }
}
