import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCom extends StatefulWidget {
  const AddCom() : super();

  @override
  State<AddCom> createState() => _AddState();
}

class _AddState extends State<AddCom> {
  GlobalKey<FormState> formState = GlobalKey();
  String _selectedPriceType = 'fix';
  String _hourlyMin = '';
  String _hourlyMax = '';
  String _fixedPrice = '';
  String _selectedScope = 'small';
  String _selectedWorkSchedule = 'full time';
  String _selectedCategory = '';
  String _selectedDuration = 'less than 1 month'; // متغير جديد لاحتواء القيمة المحددة للـ Duration

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
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 14, 71, 96),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Fill out this form, please!",
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
                                  _selectedCategory.isEmpty
                                      ? 'Search for category...'
                                      : _selectedCategory,
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
                          _buildTextInputField('Vacancies'),
                          const SizedBox(height: 20),
                          _buildScopeDropdown(),
                          const SizedBox(height: 20),
                          _buildWorkScheduleDropdown(),
                          const SizedBox(height: 20),
                          _buildDurationDropdown(), // استخدام DropdownButtonFormField للـ Duration
                          const SizedBox(height: 20),
                          Container(
                            width: 345,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black45),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Price Type',
                                  style: TextStyle(fontSize: 16),
                                ),
                                ListTile(
                                  title: const Text('Fix'),
                                  leading: Radio<String>(
                                    value: 'fix',
                                    groupValue: _selectedPriceType,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedPriceType = value!;
                                      });
                                    },
                                  ),
                                ),
                                if (_selectedPriceType == 'fix') ...[
                                  const SizedBox(height: 10),
                                  _buildNumericInputField('Fixed Price', 'fix'),
                                ],
                                ListTile(
                                  title: const Text('Hourly'),
                                  leading: Radio<String>(
                                    value: 'hourly',
                                    groupValue: _selectedPriceType,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedPriceType = value!;
                                      });
                                    },
                                  ),
                                ),
                                if (_selectedPriceType == 'hourly') ...[
                                  const SizedBox(height: 10),
                                  _buildNumericInputField('Hourly Min', 'hourlyMin'),
                                  const SizedBox(height: 10),
                                  _buildNumericInputField('Hourly Max', 'hourlyMax'),
                                ]
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildTextInputField('Skills'),
                          const SizedBox(height: 10),
                          MaterialButton(
                            textColor: const Color(0XFFE9E3D5),
                            color: const Color(0XFF033043),
                            onPressed: () {
                              if (_selectedCategory.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Please select a category from the search.",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              } else if (formState.currentState?.validate() ?? false) {
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
                                              "Success",
                                              "The operation was completed successfully",
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Colors.green,
                                              colorText: Colors.white,
                                            );
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
                                  "Error",
                                  "Form is not valid",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  colorText: Colors.white,
                                  margin: EdgeInsets.all(10),
                                  borderRadius: 10,
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

  Widget _buildWorkScheduleDropdown() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Work Schedule',
        ),
        value: _selectedWorkSchedule,
        items: ['full time', 'part time']
            .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedWorkSchedule = value!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a work schedule';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDurationDropdown() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Duration',
        ),
        value: _selectedDuration,
        items: [
          'less than 1 month',
          '1 to 3 months',
          '3 to 6 months',
          'more than 6 months'
        ]
            .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedDuration = value!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a duration';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildNumericInputField(String label, String type) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.number,
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
        onChanged: (value) {
          if (type == 'hourlyMin') {
            _hourlyMin = value;
          } else if (type == 'hourlyMax') {
            _hourlyMax = value;
          } else if (type == 'fix') {
            _fixedPrice = value;
          }
        },
      ),
    );
  }
}

class CustomSearch extends SearchDelegate<String> {
  final List<String> categoryname = [
    "flutter",
    "laravel",
    "eng",
    "teacher",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: categoryname.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(categoryname[index]),
        onTap: () {
          query = categoryname[index];
          close(context, categoryname[index]);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? categoryname
        : categoryname.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          close(context, suggestionList[index]);
        },
      ),
    );
  }
}
