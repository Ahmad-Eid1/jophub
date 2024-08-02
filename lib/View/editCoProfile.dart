import 'dart:io';
import 'package:ahmad/Controller/authenticationController.dart';
import 'package:ahmad/Model/companyData.dart';
import 'package:ahmad/Model/customFromField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class editCoProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _editCoProfileState();
}

class _editCoProfileState extends State<editCoProfile> {
  var authenticationController = AuthenticationController.authenticationController;


  Company company = Company(
    name: 'Soft Life',
    specialization: 'Information technology',
    country: 'Syria',
    website: 'WWW.softlife.com',
    description: 'A company specialized in information technology and automation systems development',
    location: 'Damascus, Al-Abed Street',
  );

  late TextEditingController nameController;
  late TextEditingController specializationController;
  late TextEditingController countryController;
  late TextEditingController websiteController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: company.name);
    specializationController = TextEditingController(text: company.specialization);
    countryController = TextEditingController(text: company.country);
    websiteController = TextEditingController(text: company.website);
    descriptionController = TextEditingController(text: company.description);
    locationController = TextEditingController(text: company.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff033043),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Edit Co profile:', style: TextStyle(
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
                      Icons.edit_outlined,
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
                      Icons.edit_outlined                   ,
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
                textInputType: TextInputType.text,
                controller: countryController,
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
                icon: Icons.web,
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
              SizedBox(
                height: 13,
              ),
              CustomFromField(
                icon: Icons.location_city_outlined,
                hintText: 'Location',
                textInputType: TextInputType.multiline,
                controller: locationController,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Color(0xff033043),
                child: ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(countryController.text);
                    print(specializationController.text);
                    print(websiteController.text);
                    print(descriptionController.text);
                    print(locationController.text);
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
}
