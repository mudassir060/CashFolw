import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  Future pickImage() async {
    // final image = await ImagePicker.pickImage(source: ImageSource.camera);
    // setState(() {
    //   file = File(image.path);
    // });
    // CircleAvatar(
    //     backgroundImage: file == null
    //         ? AssetImage("")
    //         : FileImage(File(file!.path)) as ImageProvider);
  }

  Future submit() async {
    // String title = nameController.text;
    // try {
    // image inserted in storage
    // String imageName = path.basename(imagePath);
    // firebase_storage.Reference ref =
    //     firebase_storage.FirebaseStorage.instance.ref("/$imageName");
    // File file = File(imagePath);
    // await ref.putFile(file);
    // String downloadUrl = await ref.getDownloadURL();

    // data inserted in firestore
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // await db.collection("posts").add(
    //     {"title": title, "description": description, "url": downloadUrl});
    // print("Succesfully Inserted");
    // } catch (e) {
    //   print("error ===>  $e");
    // }
    // FirebaseApi.uploadFile(destination, imageName);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: pickImage,
      icon: Icon(Icons.add_photo_alternate),
    );
  }
}
