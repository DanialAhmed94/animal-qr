import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import '../../../modal/pet_modal.dart';

class PetView3 extends StatefulWidget {
  Pet petData;

  PetView3({required this.petData});

  @override
  State<PetView3> createState() => _PetView3State();
}

class _PetView3State extends State<PetView3> {
  late TextEditingController _nameController;
  late TextEditingController _dobController;
  late TextEditingController _instagramController;
  late TextEditingController _tiktokController;
  File? _image;
  String? _base64Image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _dobController = TextEditingController();
    _instagramController = TextEditingController();
    _tiktokController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _tiktokController.dispose();
    _dobController.dispose();
    _instagramController.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      String base64Image = base64Encode(await _image!.readAsBytes());
      setState(() {
        _base64Image = base64Image;
        widget.petData.petImage = _base64Image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppConstants.skyContainerColor.withOpacity(.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pet Details",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Please provide details about your pet\nThis information will assist with\n identification in the future",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            onTap: () {
              _pickImage();
            //  widget.petData.petImage = _base64Image;
            },
            child: _image != null
                ? Container(
              height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                        image: DecorationImage(image: FileImage(_image!))),
                  )
                : Image.asset(
                    AppConstants.addImage,
                  ),
          ),
          Text(
            "Upload a Picture",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 18,
          ),
          Card(
            elevation: 8.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 31.0,
                horizontal: 22,
              ),
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        onChanged: (value) {
                          widget.petData.petName = value;
                        },
                        controller: _nameController,
                        decoration: InputDecoration(
                          label: const Text("Pet Name"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.idIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        onChanged: (value) {
                          widget.petData.petDob = value;
                        },
                        controller: _dobController,
                        decoration: InputDecoration(
                          label: const Text("Date of Birth"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.calenderIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          widget.petData.instagramUsername = value;
                        },
                        controller: _instagramController,
                        decoration: InputDecoration(
                          label: const Text("Instagram Username"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.instagramIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          widget.petData.tiktokUsername = value;
                        },
                        controller: _tiktokController,
                        decoration: InputDecoration(
                          label: const Text("Tiktok Username"),
                          border: InputBorder.none,
                          suffixIcon: SvgPicture.asset(
                            AppConstants.tiktokIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
