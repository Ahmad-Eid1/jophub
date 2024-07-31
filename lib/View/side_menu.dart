import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // قائمة لحفظ حالة الخيارات الرئيسية
  List<bool> _selections = List<bool>.filled(4, false);
  // قائمة لحفظ حالة الخيارات الفرعية لكل خيار رئيسي
  List<List<bool>> _subSelections = List.generate(4, (_) => List<bool>.filled(3, false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 14, 71, 96),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.filter_list,
                color: Color(0XFFE9E3D5),
              ),
            ),
            Text(
              "Home Page",
              style: TextStyle(
                color: Color(0XFFE9E3D5),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Container(
            width: 288,
            height: double.infinity,
            color: Color.fromARGB(255, 14, 71, 96),
            child: SafeArea(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: List.generate(4, (index) {
                        return CheckboxListTile(
                          title: Text(
                            _getOptionTitle(index),
                            style: TextStyle(color: Colors.white),
                          ),
                          value: _selections[index],
                          onChanged: (bool? value) {
                            setState(() {
                              _selections[index] = value!;
                              // Only show dialog if the option is not the last one
                              if (value && index < 3) {
                                _showSubOptionsDialog(context, index);
                              }
                            });
                          },
                          activeColor: Color(0XFFE9E3D5),
                          checkColor: Colors.black,
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getOptionTitle(int index) {
    switch (index) {
      case 0:
        return 'Category';
      case 1:
        return 'Experience Level';
      case 2:
        return 'Service Price';
      case 3:
        return 'Newest to Oldest';
      default:
        return '';
    }
  }

  void _showSubOptionsDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Find currently selected sub-option index
        int? selectedSubOptionIndex = _subSelections[index].indexOf(true);

        return AlertDialog(
          title: Text('Sub Options for ${_getOptionTitle(index)}'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (subIndex) {
                  return CheckboxListTile(
                    title: Text(_getSubOptionTitle(index, subIndex)),
                    value: _subSelections[index][subIndex],
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          // Unselect all other sub-options except the current one
                          for (int i = 0; i < _subSelections[index].length; i++) {
                            if (i != subIndex) {
                              _subSelections[index][i] = false;
                            }
                          }
                        }
                        _subSelections[index][subIndex] = value; // Update the selected sub-option
                      });
                    },
                  );
                }),
              );
            },
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _getSubOptionTitle(int index, int subIndex) {
    if (index == 0) {
      // Category
      return 'Category ${subIndex + 1}';
    } else if (index == 1) {
      // Experience Level
      return 'Experience Level ${subIndex + 1}';
    } else if (index == 2) {
      // Service Price
      return 'Service Price ${subIndex + 1}';
    } else if (index == 3) {
      // Newest to Oldest
      return subIndex == 0 ? 'Newest' : 'Oldest';
    }
    return '';
  }
}
