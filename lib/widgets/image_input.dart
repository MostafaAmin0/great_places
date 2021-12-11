import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import "package:path/path.dart" as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePic(ImageSource source) async {
    final imagePicker = ImagePicker();
    final imageFile = await imagePicker.pickImage(
      source: source,
      maxWidth: 600,
    );
    setState(() {
      if (imageFile != null) {
        _storedImage = File(imageFile.path);
      }
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _storedImage == null
              ? const Text('Not yet')
              : Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () => _takePic(ImageSource.camera),
            icon: const Icon(Icons.camera),
            label: const Text('Take pic'),
          ),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () => _takePic(ImageSource.gallery),
            icon: const Icon(Icons.photo_album),
            label: const Text('Take pic'),
          ),
        ),
      ],
    );
  }
}
