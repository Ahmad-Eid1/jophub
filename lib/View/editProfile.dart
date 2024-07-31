import 'package:ahmad/Controller/authenticationController.dart';
import 'package:ahmad/Model/personalData.dart';
import 'package:ahmad/Model/customFromField.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var authenticationController = AuthenticationController.authenticationController;

  // بيانات الشركة الافتراضية
  Personal personal = Personal(
    name: 'Talal Skekar',
    jobTitle: 'Information technology',
    country: 'USA',
    description: 'Tech Solutions is a leading innovator in the tech industry, providing cutting-edge solutions for various technological needs.',
    personalSkills: 'Innovation, Excellence, Commitment',
    gender:'male'
  );


  late TextEditingController nameController;
  late TextEditingController jobTitleController;
  late TextEditingController countryController;
  late TextEditingController genderController;
  late TextEditingController theDescriptionController;
  late TextEditingController personalSkillsController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: personal.name);
    jobTitleController = TextEditingController(text: personal.jobTitle);
    countryController = TextEditingController(text: personal.country);
    genderController = TextEditingController(text: personal.gender);
    theDescriptionController = TextEditingController(text: personal.description);
    personalSkillsController = TextEditingController(text: personal.personalSkills);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff033043),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Edit Profile', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),),
              SizedBox(
                height: 60,
              ),
              // image circle avatar
              authenticationController.imageFile == null
                  ? CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("images/IMG_٢٠٢٢٠٢٢١_١٢٣٤٤٤.jpg"),
              )
                  : Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black54,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: FileImage(
                      File(
                        authenticationController.imageFile!.path,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromGallery();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: Icon(
                      Icons.image_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  IconButton(
                    onPressed: () async {
                      await authenticationController.captureImageFileFromPhoneCamera();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomFromField(
                      controller: nameController,
                      icon: Icons.account_box_rounded,
                      hintText: 'Name',
                      textInputType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: CustomFromField(
                      icon: Icons.location_city,
                      hintText: 'Country',
                      textInputType: TextInputType.text,
                      controller: countryController,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomFromField(
                      icon: Icons.work,
                      hintText: 'Job Title',
                      textInputType: TextInputType.text,
                      controller: jobTitleController,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: CustomFromField(
                      icon: Icons.accessibility_rounded,
                      hintText: 'Gender',
                      textInputType: TextInputType.text,
                      controller: genderController,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              CustomFromField(
                icon: Icons.description_outlined,
                hintText: 'The description',
                textInputType: TextInputType.multiline,
                controller: theDescriptionController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomFromField(
                icon: Icons.calendar_month_outlined,
                hintText: 'Personal skills',
                textInputType: TextInputType.multiline,
                controller: personalSkillsController,
              ),
              ElevatedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ["pdf", "docx"]);
                  if (result == null) return;
                  final file = result.files.first;
                  print('Size:${file.size}');
                  print('Extension:${file.extension}');
                  print('Path:${file.path}');
                  final newFile = await saveFilePermanetly(file);
                  print('From Path:${file.path!}');
                  print(('To path:${newFile.path}'));
                },
                child: Text('Edit CV'),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Color(0xff033043),
                child: ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(countryController.text);
                    print(jobTitleController.text);
                    print(genderController.text);
                    print(theDescriptionController.text);
                    print(personalSkillsController.text);
                  },
                  child: Text('Done',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff033043),
                    ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanetly(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
}
