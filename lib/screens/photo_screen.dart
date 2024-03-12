import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickers_task/cubit/photo_cubit.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _loadImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Photo'),
      ),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _loadImage();
          context.read<PhotoCubit>().setPhoto(_image!);
        },
        tooltip: 'Select Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
