
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_project/constants/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import '../../../modal/pet_modal.dart';

class PetView3 extends StatefulWidget {
  Pet petData;
 late GlobalKey<FormState> formKey;

  PetView3({required this.petData, required this.formKey});

  @override
  State<PetView3> createState() => _PetView3State();
}

class _PetView3State extends State<PetView3> {
  late TextEditingController _nameController;
  late TextEditingController _dobController;
  late TextEditingController _instagramController;
  late TextEditingController _tiktokController;

  late TextEditingController _parren1Controller;
  late TextEditingController _phoneController;
  late TextEditingController _parren2Controller;
  late TextEditingController _ageController;
  late TextEditingController _aboutController;
  late TextEditingController _addressController;

  late FocusNode _nameFocusNode;
  late FocusNode _dobFocusNode;
  late FocusNode _instagramFocusNode;
  late FocusNode _tiktokFocusNode;

  late FocusNode _parrent1FocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _parrent2FocusNode;
  late FocusNode _ageFocusNode;
  late FocusNode _aboutFocusNode;
  late FocusNode _addrressFocusNode;

  File? _image;
  String? _base64Image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _dobController = TextEditingController();
    _instagramController = TextEditingController();
    _tiktokController = TextEditingController();

    _parren1Controller = TextEditingController();
    _phoneController = TextEditingController();
    _parren2Controller= TextEditingController();
    _ageController = TextEditingController();
    _aboutController = TextEditingController();
    _addressController = TextEditingController();


    _nameFocusNode = FocusNode();
    _dobFocusNode = FocusNode();
    _instagramFocusNode = FocusNode();
    _tiktokFocusNode = FocusNode();

    _parrent1FocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _parrent2FocusNode  = FocusNode();
    _ageFocusNode = FocusNode();
    _aboutFocusNode = FocusNode();
    _addrressFocusNode = FocusNode();

  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _instagramController.dispose();
    _tiktokController.dispose();

    _parren1Controller.dispose();
    _phoneController.dispose();
    _parren2Controller.dispose();
    _ageController.dispose();
    _aboutController.dispose();
    _addressController.dispose();

    _nameFocusNode.dispose();
    _dobFocusNode.dispose();
    _instagramFocusNode.dispose();
    _tiktokFocusNode.dispose();

    _parrent1FocusNode.dispose();
    _phoneFocusNode.dispose();
    _parrent2FocusNode.dispose();
    _ageFocusNode.dispose();
    _aboutFocusNode.dispose();
    _addrressFocusNode.dispose();
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

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String base64Image = base64Encode(await imageFile.readAsBytes());
      setState(() {
        _image = imageFile;
        _base64Image = base64Image;
        widget.petData.petImage = base64Image;
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Select Image Source",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0, // Adjust font size as needed
              fontWeight: FontWeight.bold,
              // Change this to your desired color
            ),
          ),

          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                IconButton(
                icon: Container(
                  height:80,
                  width:80,
                  child:SvgPicture.asset("assets/svg/Camera.svg"),),
                onPressed: () {
                  _pickImage();
                  Navigator.pop(context);
                },
              ),
              Text("Camera",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0, // Adjust font size as needed
                  fontWeight: FontWeight.bold,
                  // Change this to your desired color
                ),)]),

              Column(
                  mainAxisSize: MainAxisSize.min,

                  children:[
                IconButton(
                  icon: Container(
                    height:80,
                    width:80,
                    child:SvgPicture.asset("assets/svg/Gallery.svg"),),
                  onPressed: () {
                    _pickImageFromGallery();
                    Navigator.pop(context);
                  },
                ),
                Text("Gallery",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0, // Adjust font size as needed
                    fontWeight: FontWeight.bold,
                    // Change this to your desired color
                  ),)]),
            ],
          ),
        );
      },
    );
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "Please provide details about your pet\nThis information will assist with\n identification in the future",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
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
              _showImageSourceDialog();
              // _pickImage();
            },
            child: _image != null
                ? Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: FileImage(_image!)),
              ),
            )
                : Image.asset(
              AppConstants.addImage,
            ),
          ),
          Text(
            "Upload a Picture",
            style: Theme
                .of(context)
                .textTheme
                .titleSmall,
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
              child: Form(
                key: widget.formKey, // Add a GlobalKey<FormState> _formKey;
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          focusNode: _parrent1FocusNode,
                          controller: _parren1Controller,
                          decoration: InputDecoration(
                            label: const Text("First Name pet owner"),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the first name';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            widget.petData.parent1 = value;
                          },
                          onEditingComplete: () {
                            widget.petData.parent1 = _parren1Controller.text;
                            _fieldFocusChange(
                                context, _parrent1FocusNode, _parrent2FocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _parrent2FocusNode,
                          controller: _parren2Controller,
                          decoration: InputDecoration(
                            label: const Text("Last Name pet owner"),
                            border: InputBorder.none,
                          ),

                          onChanged: (value) {
                            widget.petData.parent2 = value;
                          },
                          onEditingComplete: () {
                            widget.petData.parent2 = _parren2Controller.text;
                            _fieldFocusChange(
                                context, _parrent2FocusNode, _aboutFocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _aboutFocusNode,
                          controller: _aboutController,
                          decoration: InputDecoration(
                            label: const Text("BIO"),
                            border: InputBorder.none,
                          ),

                          onChanged: (value) {
                            widget.petData.description = value;
                          },
                          onEditingComplete: () {
                            widget.petData.description = _aboutController.text;
                            _fieldFocusChange(
                                context, _aboutFocusNode, _addrressFocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _addrressFocusNode,
                          controller: _addressController,
                          decoration: InputDecoration(
                            label: const Text("Address"),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            widget.petData.address = value;
                          },
                          onEditingComplete: () {
                            widget.petData.address = _addressController.text;
                            _fieldFocusChange(
                                context, _addrressFocusNode, _phoneFocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _phoneFocusNode,
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            label: const Text("Phone"),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your pet\'s age';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            widget.petData.phone = value;
                          },
                          onEditingComplete: () {
                            widget.petData.phone = _phoneController.text;
                            _fieldFocusChange(context, _phoneFocusNode, _ageFocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _ageFocusNode,
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            label: const Text("Age"),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your pet\'s age';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            widget.petData.age = value;
                          },
                          onEditingComplete: () {
                            widget.petData.age = _ageController.text;
                            _fieldFocusChange(context, _ageFocusNode, _nameFocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _nameFocusNode,
                          controller: _nameController,
                          decoration: InputDecoration(
                            label: const Text("Pet Name"),
                            border: InputBorder.none,
                            suffixIcon: SvgPicture.asset(
                              AppConstants.idIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your pet\'s name';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            widget.petData.petName = value;
                          },
                          onEditingComplete: () {
                            widget.petData.petName = _nameController.text;
                            _fieldFocusChange(
                                context, _nameFocusNode, _instagramFocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _instagramFocusNode,
                          controller: _instagramController,
                          decoration: InputDecoration(
                            label: const Text("Instagram Username"),
                            border: InputBorder.none,
                            suffixIcon: SvgPicture.asset(
                              AppConstants.instagramIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),

                          onChanged: (value) {
                            widget.petData.instagramUsername = value;
                          },
                          onEditingComplete: () {
                            widget.petData.instagramUsername =
                                _instagramController.text;
                            _fieldFocusChange(
                                context, _instagramFocusNode, _tiktokFocusNode);
                          },
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
                        child: TextFormField(
                          focusNode: _tiktokFocusNode,
                          controller: _tiktokController,
                          decoration: InputDecoration(
                            label: const Text("Tiktok Username"),
                            border: InputBorder.none,
                            suffixIcon: SvgPicture.asset(
                              AppConstants.tiktokIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          onChanged: (value) {
                            widget.petData.tiktokUsername = value;
                          },
                          onEditingComplete: () {
                            widget.petData.tiktokUsername =
                                _tiktokController.text;
                          },
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
                        child: GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate =
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _dobController.text = pickedDate
                                    .toString()
                                    .substring(0, 10);
                                widget.petData.petDob =
                                    _dobController.text.toString();
                              });
                            }
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              focusNode: _dobFocusNode,
                              controller: _dobController,
                              decoration: InputDecoration(
                                label: const Text("Pet DOB"),
                                border: InputBorder.none,
                                suffixIcon: SvgPicture.asset(
                                  AppConstants.calenderIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your pet\'s DOB';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // child: Column(
              //   children: [
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: TextField(
              //           focusNode: _parrent1FocusNode,
              //           controller: _parren1Controller,
              //           decoration: InputDecoration(
              //             label: const Text("First Name pet owner"),
              //             border: InputBorder.none,
              //             // suffixIcon: SvgPicture.asset(
              //             //   AppConstants.idIcon,
              //             //   fit: BoxFit.scaleDown,
              //             // ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.parent1 = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.parent1 = _parren1Controller.text;
              //             _fieldFocusChange(
              //                 context, _parrent1FocusNode, _parrent2FocusNode);
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: TextField(
              //           focusNode: _parrent2FocusNode,
              //           controller: _parren2Controller,
              //           decoration: InputDecoration(
              //             label: const Text("Last Name pet owner"),
              //             border: InputBorder.none,
              //             // suffixIcon: SvgPicture.asset(
              //             //   AppConstants.idIcon,
              //             //   fit: BoxFit.scaleDown,
              //             // ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.parent2 = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.parent2 = _parren2Controller.text;
              //             _fieldFocusChange(
              //                 context, _parrent2FocusNode, _aboutFocusNode);
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //
              //
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: TextField(
              //           focusNode: _aboutFocusNode,
              //           controller: _aboutController,
              //           decoration: InputDecoration(
              //             label: const Text("BIO"),
              //             border: InputBorder.none,
              //             // suffixIcon: SvgPicture.asset(
              //             //   AppConstants.idIcon,
              //             //   fit: BoxFit.scaleDown,
              //             // ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.description = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.description = _aboutController.text;
              //             _fieldFocusChange(
              //                 context, _aboutFocusNode, _addrressFocusNode);
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: TextField(
              //           focusNode: _addrressFocusNode,
              //           controller: _addressController,
              //           decoration: InputDecoration(
              //             label: const Text("Address"),
              //             border: InputBorder.none,
              //             // suffixIcon: SvgPicture.asset(
              //             //   AppConstants.idIcon,
              //             //   fit: BoxFit.scaleDown,
              //             // ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.address = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.address = _addressController.text;
              //             _fieldFocusChange(
              //                 context, _addrressFocusNode, _ageFocusNode);
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: TextField(
              //           focusNode: _ageFocusNode,
              //           controller: _ageController,
              //           keyboardType: TextInputType.number,
              //           inputFormatters: <TextInputFormatter>[
              //             FilteringTextInputFormatter.digitsOnly
              //           ],
              //           decoration: InputDecoration(
              //             label: const Text("Age"),
              //             border: InputBorder.none,
              //             // suffixIcon: SvgPicture.asset(
              //             //   AppConstants.idIcon,
              //             //   fit: BoxFit.scaleDown,
              //             // ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.age = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.age = _ageController.text;
              //             _fieldFocusChange(
              //                 context, _ageFocusNode, _nameFocusNode);
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: TextField(
              //           focusNode: _nameFocusNode,
              //           controller: _nameController,
              //           decoration: InputDecoration(
              //             label: const Text("Pet Name"),
              //             border: InputBorder.none,
              //             suffixIcon: SvgPicture.asset(
              //               AppConstants.idIcon,
              //               fit: BoxFit.scaleDown,
              //             ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.petName = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.petName = _nameController.text;
              //             _fieldFocusChange(
              //                 context, _nameFocusNode, _instagramFocusNode);
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //         child: TextField(
              //           focusNode: _instagramFocusNode,
              //           controller: _instagramController,
              //           decoration: InputDecoration(
              //             label: const Text("Instagram Username"),
              //             border: InputBorder.none,
              //             suffixIcon: SvgPicture.asset(
              //               AppConstants.instagramIcon,
              //               fit: BoxFit.scaleDown,
              //             ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.instagramUsername = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.instagramUsername =
              //                 _instagramController.text;
              //             _fieldFocusChange(
              //                 context, _instagramFocusNode, _tiktokFocusNode);
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //         child: TextField(
              //           focusNode: _tiktokFocusNode,
              //           controller: _tiktokController,
              //           decoration: InputDecoration(
              //             label: const Text("Tiktok Username"),
              //             border: InputBorder.none,
              //             suffixIcon: SvgPicture.asset(
              //               AppConstants.tiktokIcon,
              //               fit: BoxFit.scaleDown,
              //             ),
              //           ),
              //           onChanged: (value) {
              //             widget.petData.tiktokUsername = value;
              //           },
              //           onEditingComplete: () {
              //             widget.petData.tiktokUsername = _tiktokController.text;
              //           },
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //     Material(
              //       borderRadius: BorderRadius.circular(10),
              //       surfaceTintColor: Colors.white,
              //       elevation: 5,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: GestureDetector(
              //           onTap: () async {
              //             final DateTime? pickedDate =
              //             await showDatePicker(
              //               context: context,
              //               initialDate: DateTime.now(),
              //               firstDate: DateTime(1900),
              //               lastDate: DateTime.now(),
              //             );
              //             if (pickedDate != null) {
              //               setState(() {
              //                 _dobController.text = pickedDate
              //                     .toString()
              //                     .substring(0, 10);
              //                 widget.petData.petDob = _dobController.text.toString();
              //               });
              //             }
              //           },
              //           child: AbsorbPointer(
              //             child: TextField(
              //               focusNode: _dobFocusNode,
              //               controller: _dobController,
              //               decoration: InputDecoration(
              //                 label: const Text("Date of Birth"),
              //                 border: InputBorder.none,
              //                 suffixIcon: SvgPicture.asset(
              //                   AppConstants.calenderIcon,
              //                   fit: BoxFit.scaleDown,
              //                 ),
              //               ),
              //               onChanged: (value) {
              //                 widget.petData.petDob = value;
              //               },
              //               onEditingComplete: () {
              //                 widget.petData.petDob = _dobController.text;
              //                 _fieldFocusChange(
              //                     context, _dobFocusNode, _instagramFocusNode);
              //               },
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }

  // Function to change focus to the next field
  void _fieldFocusChange(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}





// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pet_project/constants/app_constants.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../modal/pet_modal.dart';
//
// class PetView3 extends StatefulWidget {
//   Pet petData;
//
//   PetView3({required this.petData});
//
//   @override
//   State<PetView3> createState() => _PetView3State();
// }
//
// class _PetView3State extends State<PetView3> {
//   late TextEditingController _nameController;
//   late TextEditingController _dobController;
//   late TextEditingController _instagramController;
//   late TextEditingController _tiktokController;
//
//   late TextEditingController _parren1Controller;
//   late TextEditingController _parren2Controller;
//   late TextEditingController _ageController;
//   late TextEditingController _aboutController;
//   late TextEditingController _addressController;
//
//   late FocusNode _nameFocusNode;
//   late FocusNode _dobFocusNode;
//   late FocusNode _instagramFocusNode;
//   late FocusNode _tiktokFocusNode;
//
//   late FocusNode _parrent1FocusNode;
//   late FocusNode _parrent2FocusNode;
//   late FocusNode _ageFocusNode;
//   late FocusNode _aboutFocusNode;
//   late FocusNode _addrressFocusNode;
//
//   File? _image;
//   String? _base64Image;
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _dobController = TextEditingController();
//     _instagramController = TextEditingController();
//     _tiktokController = TextEditingController();
//
//      _parren1Controller = TextEditingController();
//      _parren2Controller= TextEditingController();
//      _ageController = TextEditingController();
//      _aboutController = TextEditingController();
//      _addressController = TextEditingController();
//
//
//     _nameFocusNode = FocusNode();
//     _dobFocusNode = FocusNode();
//     _instagramFocusNode = FocusNode();
//     _tiktokFocusNode = FocusNode();
//
//     _parrent1FocusNode = FocusNode();
//     _parrent2FocusNode  = FocusNode();
//     _ageFocusNode = FocusNode();
//     _aboutFocusNode = FocusNode();
//     _addrressFocusNode = FocusNode();
//
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _nameController.dispose();
//     _dobController.dispose();
//     _instagramController.dispose();
//     _tiktokController.dispose();
//
//     _parren1Controller.dispose();
//     _parren2Controller.dispose();
//     _ageController.dispose();
//     _aboutController.dispose();
//     _addressController.dispose();
//
//     _nameFocusNode.dispose();
//     _dobFocusNode.dispose();
//     _instagramFocusNode.dispose();
//     _tiktokFocusNode.dispose();
//
//     _parrent1FocusNode.dispose();
//     _parrent2FocusNode.dispose();
//     _ageFocusNode.dispose();
//     _aboutFocusNode.dispose();
//     _addrressFocusNode.dispose();
//   }
//
//   Future<void> _pickImage() async {
//     final pickedFile =
//     await ImagePicker().pickImage(source: ImageSource.camera);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//
//       String base64Image = base64Encode(await _image!.readAsBytes());
//       setState(() {
//         _base64Image = base64Image;
//         widget.petData.petImage = _base64Image;
//       });
//     }
//   }
//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Select Image Source"),
//           content: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.camera_alt),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.camera);
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.photo),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.gallery);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 5,
//           ),
//           Container(
//             padding: const EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: AppConstants.skyContainerColor.withOpacity(.3),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Pet Details",
//                   style: Theme
//                       .of(context)
//                       .textTheme
//                       .titleMedium
//                       ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   "Please provide details about your pet\nThis information will assist with\n identification in the future",
//                   style: Theme
//                       .of(context)
//                       .textTheme
//                       .bodyLarge
//                       ?.copyWith(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 8.0,
//           ),
//           GestureDetector(
//             onTap: () {
//               _pickImage();
//             },
//             child: _image != null
//                 ? Container(
//               height: 200,
//               width: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(image: FileImage(_image!)),
//               ),
//             )
//                 : Image.asset(
//               AppConstants.addImage,
//             ),
//           ),
//           Text(
//             "Upload a Picture",
//             style: Theme
//                 .of(context)
//                 .textTheme
//                 .titleSmall,
//           ),
//           const SizedBox(
//             height: 18,
//           ),
//           Card(
//             elevation: 8.0,
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 31.0,
//                 horizontal: 22,
//               ),
//               child: Column(
//                 children: [
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextField(
//                         focusNode: _parrent1FocusNode,
//                         controller: _parren1Controller,
//                         decoration: InputDecoration(
//                           label: const Text("Parent1"),
//                           border: InputBorder.none,
//                           // suffixIcon: SvgPicture.asset(
//                           //   AppConstants.idIcon,
//                           //   fit: BoxFit.scaleDown,
//                           // ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.parent1 = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.parent1 = _parren1Controller.text;
//                           _fieldFocusChange(
//                               context, _parrent1FocusNode, _parrent2FocusNode);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextField(
//                         focusNode: _parrent2FocusNode,
//                         controller: _parren2Controller,
//                         decoration: InputDecoration(
//                           label: const Text("Parent2"),
//                           border: InputBorder.none,
//                           // suffixIcon: SvgPicture.asset(
//                           //   AppConstants.idIcon,
//                           //   fit: BoxFit.scaleDown,
//                           // ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.parent2 = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.parent2 = _parren2Controller.text;
//                           _fieldFocusChange(
//                               context, _parrent2FocusNode, _aboutFocusNode);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//
//
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextField(
//                         focusNode: _aboutFocusNode,
//                         controller: _aboutController,
//                         decoration: InputDecoration(
//                           label: const Text("About pet"),
//                           border: InputBorder.none,
//                           // suffixIcon: SvgPicture.asset(
//                           //   AppConstants.idIcon,
//                           //   fit: BoxFit.scaleDown,
//                           // ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.description = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.description = _aboutController.text;
//                           _fieldFocusChange(
//                               context, _aboutFocusNode, _addrressFocusNode);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextField(
//                         focusNode: _addrressFocusNode,
//                         controller: _addressController,
//                         decoration: InputDecoration(
//                           label: const Text("Address"),
//                           border: InputBorder.none,
//                           // suffixIcon: SvgPicture.asset(
//                           //   AppConstants.idIcon,
//                           //   fit: BoxFit.scaleDown,
//                           // ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.address = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.address = _addressController.text;
//                           _fieldFocusChange(
//                               context, _addrressFocusNode, _ageFocusNode);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextField(
//                         focusNode: _ageFocusNode,
//                         controller: _ageController,
//                         keyboardType: TextInputType.number,
//                         inputFormatters: <TextInputFormatter>[
//                           FilteringTextInputFormatter.digitsOnly
//                         ],
//                         decoration: InputDecoration(
//                           label: const Text("Age"),
//                           border: InputBorder.none,
//                           // suffixIcon: SvgPicture.asset(
//                           //   AppConstants.idIcon,
//                           //   fit: BoxFit.scaleDown,
//                           // ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.age = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.age = _ageController.text;
//                           _fieldFocusChange(
//                               context, _ageFocusNode, _nameFocusNode);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: TextField(
//                         focusNode: _nameFocusNode,
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                           label: const Text("Pet Name"),
//                           border: InputBorder.none,
//                           suffixIcon: SvgPicture.asset(
//                             AppConstants.idIcon,
//                             fit: BoxFit.scaleDown,
//                           ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.petName = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.petName = _nameController.text;
//                           _fieldFocusChange(
//                               context, _nameFocusNode, _instagramFocusNode);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: TextField(
//                         focusNode: _instagramFocusNode,
//                         controller: _instagramController,
//                         decoration: InputDecoration(
//                           label: const Text("Instagram Username"),
//                           border: InputBorder.none,
//                           suffixIcon: SvgPicture.asset(
//                             AppConstants.instagramIcon,
//                             fit: BoxFit.scaleDown,
//                           ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.instagramUsername = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.instagramUsername =
//                               _instagramController.text;
//                           _fieldFocusChange(
//                               context, _instagramFocusNode, _tiktokFocusNode);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: TextField(
//                         focusNode: _tiktokFocusNode,
//                         controller: _tiktokController,
//                         decoration: InputDecoration(
//                           label: const Text("Tiktok Username"),
//                           border: InputBorder.none,
//                           suffixIcon: SvgPicture.asset(
//                             AppConstants.tiktokIcon,
//                             fit: BoxFit.scaleDown,
//                           ),
//                         ),
//                         onChanged: (value) {
//                           widget.petData.tiktokUsername = value;
//                         },
//                         onEditingComplete: () {
//                           widget.petData.tiktokUsername = _tiktokController.text;
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Material(
//                     borderRadius: BorderRadius.circular(10),
//                     surfaceTintColor: Colors.white,
//                     elevation: 5,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: GestureDetector(
//                         onTap: () async {
//                           final DateTime? pickedDate =
//                           await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime(1900),
//                             lastDate: DateTime.now(),
//                           );
//                           if (pickedDate != null) {
//                             setState(() {
//                               _dobController.text = pickedDate
//                                   .toString()
//                                   .substring(0, 10);
//                               widget.petData.petDob = _dobController.text.toString();
//                             });
//                           }
//                         },
//                         child: AbsorbPointer(
//                           child: TextField(
//                             focusNode: _dobFocusNode,
//                             controller: _dobController,
//                             decoration: InputDecoration(
//                               label: const Text("Date of Birth"),
//                               border: InputBorder.none,
//                               suffixIcon: SvgPicture.asset(
//                                 AppConstants.calenderIcon,
//                                 fit: BoxFit.scaleDown,
//                               ),
//                             ),
//                             onChanged: (value) {
//                               widget.petData.petDob = value;
//                             },
//                             onEditingComplete: () {
//                               widget.petData.petDob = _dobController.text;
//                               _fieldFocusChange(
//                                   context, _dobFocusNode, _instagramFocusNode);
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 14,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Function to change focus to the next field
//   void _fieldFocusChange(BuildContext context, FocusNode currentFocus,
//       FocusNode nextFocus) {
//     currentFocus.unfocus();
//     FocusScope.of(context).requestFocus(nextFocus);
//   }
// }
//
//
