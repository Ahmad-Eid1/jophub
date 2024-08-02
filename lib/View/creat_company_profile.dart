import 'dart:io';

import 'package:ahmad/Controller/authenticationController.dart';
import 'package:ahmad/Model/customFromField.dart';
import 'package:ahmad/View/home_page_company.dart';
import 'package:ahmad/View/home_page_user.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class creat_company_profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _creat_company_profileState();
}

class _creat_company_profileState extends State<creat_company_profile> {
  var authenticationController =
      AuthenticationController.authenticationController;
  var nameController = TextEditingController();
  var specializationController = TextEditingController();
  var countryController = TextEditingController();
  var websiteController = TextEditingController();
  var descriptionController = TextEditingController();
  var locationController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff033043),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Creat Co profile:', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),),
              SizedBox(
                height: 30,
              ),
              // image circle avatar
              authenticationController.imageFile == null
                  ? CircleAvatar(
                radius: 60,
                backgroundImage:
                AssetImage("images/pexels-pixabay-273250.jpg"),
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
              //icon pick image
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
              //name
              CustomFromField(
                icon: Icons.abc_outlined,
                hintText: 'Name',
                textInputType: TextInputType.text,
                controller: nameController,
              ),

              SizedBox(
                height: 13,
              ),
              //country
              CustomFromField(
                icon: Icons.location_city,
                hintText: 'Country',
                textInputType: TextInputType.number,
                controller: locationController,
              ),

              SizedBox(
                height: 13,
              ),
              //Specialization
              CustomFromField(
                icon: Icons.work,
                hintText: 'Specialization',
                textInputType: TextInputType.text,
                controller: specializationController,
              ),

              SizedBox(
                height: 13,
              ),
              //web site
              CustomFromField(
                icon: Icons.accessibility_rounded,
                hintText: 'Web site',
                textInputType: TextInputType.text,
                controller: websiteController,
              ),

              SizedBox(
                height: 13,
              ),
              //About us
              CustomFromField(
                icon: Icons.description_outlined,
                hintText: 'Description',
                textInputType: TextInputType.multiline,
                controller: descriptionController,
              ),
              CustomFromField(
                icon: Icons.location_city_outlined,
                hintText: 'Location',
                textInputType: TextInputType.multiline,
                controller: locationController,
              ),
              Container(
                width:double.infinity,

                color:Color(0xff033043) ,
                child: ElevatedButton(

                  onPressed: () {

                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home_page_company()),
                      );
                    }
                    print(nameController.text);
                    print(countryController.text);
                    print(specializationController.text);
                    print(websiteController.text);
                    print(descriptionController.text);
                    print(locationController.text);

                  },
                  child: Text('Done',
                  style: TextStyle(
                    fontSize:20 ,
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
}