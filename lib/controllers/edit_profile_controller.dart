import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tulsiresin/config.dart';

class EditProfileController extends GetxController{
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtName = TextEditingController();
  File? selectedFile;

  final picker = ImagePicker();

  //Camera or Gallery
  getImage(ImageSource source, context) async {
    PickedFile? pickedFile = await picker.getImage(source: source,imageQuality: 80,maxHeight: 1350,maxWidth: 1080);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      selectedFile = file;
      update();
    } else {
      update();
    }
  }

  //option from where to pickup the photo
  openSelector(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.camera, context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.gallery, context);
              },
            )
          ],
        );
      },
    );
  }

}