import 'package:ahmad/Controller/authenticationController.dart';
import 'package:ahmad/Model/customFromField.dart';
import 'package:ahmad/View/home_page_user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class creat_personal_profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _creat_personal_profileState();
}

class _creat_personal_profileState extends State<creat_personal_profile> {
  var authenticationController =
      AuthenticationController.authenticationController;
  var nameController = TextEditingController();
  var jopTitleController = TextEditingController();
  var countryController = TextEditingController();
  var genderController = TextEditingController();
  var thedescriptionController = TextEditingController();
  var personalskillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff033043),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Creat Per profile:', style: TextStyle(
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
                backgroundImage: AssetImage("images/3135715.png"),
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
                      await authenticationController
                          .captureImageFileFromPhoneCamera();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: Icon(
                      Icons.camera_alt_outlined,
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
                      textInputType: TextInputType.number,
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
                      controller: jopTitleController,
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

              SizedBox(
                height: 20,
              ),

              CustomFromField(
                icon: Icons.description_outlined,
                hintText: 'The description',
                textInputType: TextInputType.multiline,
                controller: thedescriptionController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomFromField(
                icon: Icons.calendar_month_outlined,
                hintText: 'Personal skills',
                textInputType: TextInputType.multiline,
                controller: personalskillsController,
              ),
               Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 ElevatedButton(
                     onPressed: () async {
                       final result = await FilePicker.platform.pickFiles(
                           type: FileType.custom,
                           allowedExtensions: ["pdf", "docx"]);
                       if (result == null) return;
                       //open single file
                       final file = result.files.first;
                       // openFile(file);
                       //  print('Name:${file.name}');
                       //  print('Bytes:${file.bytes}');
                       print('Size:${file.size}');
                       print('Extension:${file.extension}');
                       print('Path:${file.path}');
                       final newFile = await saveFilePermanetly(file);
                       print('From Path:${file.path!}');
                       print(('To path:${newFile.path}'));
                     },
                     child: Text('Upload CV')),


               ],)
               ,
              SizedBox(height: 20,),
              Container(
                width:double.infinity,

                color:Color(0xff033043) ,
                child: ElevatedButton(

                  onPressed: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home_page_users()),
                      );
                    }
                    print(nameController.text);
                    print(countryController.text);
                    print(jopTitleController.text);
                    print(genderController.text);
                    print(thedescriptionController.text);
                    print(personalskillsController.text);

                  },
                  child: Text('Done',
                    style: TextStyle(
                      fontSize:20 ,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff033043),
                    ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
//زر يروح على الهوم بيج يوزر
 void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanetly(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
