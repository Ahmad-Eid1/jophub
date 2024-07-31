import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add extends StatefulWidget {
  const Add() : super();

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  GlobalKey<FormState> formState = GlobalKey();
  String _selectedScope = 'small';
  String _selectedExperienceLevel = 'entry level';
  bool _isCategorySelected = false;
  String? _selectedCategory;
  List<String> _skills = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF033043),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 14, 71, 96),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Fill out this form, please!  ",
                          style: TextStyle(
                            color: Color(0XFFE9E3D5),
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formState,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0XFF033043),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            width: 340,
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () async {
                                    final result = await showSearch(
                                      context: context,
                                      delegate: CustomSearch(),
                                    );
                                    if (result != null) {
                                      setState(() {
                                        _isCategorySelected = true;
                                        _selectedCategory = result;
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Color(0XFFE9E3D5),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  _selectedCategory ?? 'Search for category...',
                                  style: const TextStyle(
                                    color: Color(0XFFE9E3D5),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildTextInputField('The job title'),
                          const SizedBox(height: 20),
                          _buildTextInputField('Description'),
                          const SizedBox(height: 20),
                          _buildTextInputField('Qualifications'),
                          const SizedBox(height: 20),
                          _buildExperienceLevelDropdown(),
                          const SizedBox(height: 20),
                          _buildScopeDropdown(),
                          const SizedBox(height: 20),
                          _buildTextInputField('Duration'),
                          const SizedBox(height: 20),
                          _buildTextInputField('Hourly_payment'),
                          const SizedBox(height: 20),
                          _buildSkillSearchField(),
                          const SizedBox(height: 10),
                          MaterialButton(
                            textColor: const Color(0XFFE9E3D5),
                            color: const Color(0XFF033043),
                            onPressed: () {
                              if (!_isCategorySelected) {
                                Get.snackbar(
                                  'Error',
                                  'Please select a category before proceeding.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                                return;
                              }

                              if (formState.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm"),
                                      content: const Text(
                                          "Are you sure you want to proceed with the action?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Get.snackbar(
                                              'Success',
                                              'Action executed successfully.',
                                              backgroundColor: Colors.green,
                                              colorText: Colors.white,
                                            );
                                            print(
                                                "Action executed after confirmation ");
                                          },
                                          child: const Text("Yes"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("No"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                Get.snackbar(
                                  'Error',
                                  'Please fill out all fields correctly.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            },
                            child: const Text('Done'),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputField(String label) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildScopeDropdown() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Scope',
        ),
        value: _selectedScope,
        items: ['small', 'medium', 'large']
            .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedScope = value!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a scope';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildExperienceLevelDropdown() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Experience Level',
        ),
        value: _selectedExperienceLevel,
        items: ['entry level', 'intermediate level', 'senior level']
            .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedExperienceLevel = value!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an experience level';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSkillSearchField() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF033043),
          borderRadius: BorderRadius.circular(14),
        ),
        width: 340,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: () async {
                final result = await showSearch(
                  context: context,
                  delegate: CustomSearch(),
                );
                if (result != null) {
                  setState(() {
                    _isCategorySelected = true;
                    _selectedCategory = result;
                  });
                }
              },
              icon: const Icon(
                Icons.search,
                color: Color(0XFFE9E3D5),
              ),
            ),
            const SizedBox(width: 2),
            Text(
              _selectedCategory ?? 'Search for category...',
              style: const TextStyle(
                color: Color(0XFFE9E3D5),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),

      // child: TextFormField(
      //   readOnly: true,
      //   decoration: InputDecoration(
      //     border: const OutlineInputBorder(),
      //     labelText: 'Search for Skills',
      //     prefixIcon: IconButton(
      //       icon: const Icon(Icons.search),
      //       onPressed: () async {
      //         final result = await showSearch(
      //           context: context,
      //           delegate: CustomSkillSearch(),
      //         );
      //         if (result != null) {
      //           setState(() {
      //             _skills.add(result);
      //           });
      //         }
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

class CustomSearch extends SearchDelegate<String> {
  List categoryname = [
    "flutter",
    "laravel",
    "eng",
    "teacher",
  ];

  List? filterList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('result');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemCount: categoryname.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              close(context, categoryname[i]);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${categoryname[i]}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      );
    } else {
      filterList =
          categoryname.where((element) => element.contains(query)).toList();
      return ListView.builder(
        itemCount: filterList!.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              close(context, filterList![i]);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${filterList![i]}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}

class CustomSkillSearch extends SearchDelegate<String> {
  List skills = [
    "Dart",
    "Flutter",
    "Laravel",
    "JavaScript",
    "Python",
  ];

  List? filterList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('result');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              close(context, skills[i]);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${skills[i]}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      );
    } else {
      filterList = skills.where((element) => element.contains(query)).toList();
      return ListView.builder(
        itemCount: filterList!.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              close(context, filterList![i]);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "${filterList![i]}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
