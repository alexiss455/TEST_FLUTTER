import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';

class IDUploader extends StatefulWidget {
  @override
  _IDUploaderState createState() => _IDUploaderState();
}

class _IDUploaderState extends State<IDUploader> {
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // 📌 change to ImageSource.camera for camera
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: SvgPicture.asset(
                    width: 25,
                    height: 25,
                    "assets/img/icon/icon-upload-image.svg"),
                title: CustomText(text: "Choose from Gallery"),
                onTap: () {
                  _pickImage();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                    width: 25, height: 25, "assets/img/icon/icon-camera.svg"),
                title: CustomText(text: "Take a Photo"),
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickImage(
                    source: ImageSource.camera,
                    imageQuality: 80,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImage = File(pickedFile.path);
                    });
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => _showPickerOptions(context),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(16),
          dashPattern: [6, 3],
          color: AppColors.grey,
          strokeWidth: 2,
          child: Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              child: _selectedImage == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: AppColors.primaryLight,
                              width: 1,
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/img/icon/icon-upload-image.svg",
                            width: 28,
                            height: 28,
                            color: AppColors.primary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 16.0),
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: BoxDecoration(
                            color: AppColors.greyLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CustomText(
                            fontSize: 14,
                            text: "Upload or Take Photo of your ID",
                          ),
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        // prevent Flutter from reducing resolution
                        cacheWidth: null,
                        cacheHeight: null,
                      ),
                    )),
        ),
      ),
    );
  }
}
