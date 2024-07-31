

import 'package:ahmad/View/PostsScreen%20(2).dart';
import 'package:ahmad/View/Slideshow.dart';
import 'package:ahmad/View/favorite.dart';
import 'package:ahmad/View/form_user.dart';
import 'package:ahmad/View/side_menu.dart';
import 'package:ahmad/View/sitting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//import 'custom_search.dart'; // تأكد من استيراد ملف البحث هنا

class HomePageusers extends StatefulWidget {
  const HomePageusers() : super();

  @override
  State<HomePageusers> createState() => _HomePageusersState();
}

class _HomePageusersState extends State<HomePageusers> {
  int _selectedIndex = 0;
  double _iconElevation = 0.0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _iconElevation = 8.0; // تعديل ارتفاع الايقونة عند الضغط

      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => favorite())); //   بالصفحة التي ترغب في الانتقال إليها
      }

      if (index == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageusers())); // استبدل  بالصفحة التي ترغب في الانتقال إليها
      }

      if (index == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Sitting())); //   بالصفحة التي ترغب في الانتقال إليها
      }

      if (index == 3) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => favorite())); //   بالصفحة التي ترغب في الانتقال إليها
      }

      if (index == 4) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Add())); //   بالصفحة التي ترغب في الانتقال إليها
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 14, 71, 96), //elevation: _selectedIndex == 0 ? _iconElevation : 0
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 14, 71, 96), //elevation: _selectedIndex == 0 ? _iconElevation : 1
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 14, 71, 96), // elevation: _selectedIndex == 0 ? _iconElevation : 2
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 14, 71, 96), //elevation: _selectedIndex == 0 ? _iconElevation : 3
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Color.fromARGB(255, 14, 71, 96), // elevation: _selectedIndex == 0 ? _iconElevation : 4
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: Color(0XFF033043),
      body: SafeArea(
        // بقية العناصر في الصفحة

        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 14, 71, 96),
                            borderRadius: BorderRadius.circular(14)),
                        padding: EdgeInsets.all(3),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return SideMenu();
                            }));
                          },
                          icon: Icon(
                            Icons.filter_list,
                            color: Color(0XFFE9E3D5),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  //SizedBox(width: 4),
                  Column(
                    children: [
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
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 14, 71, 96), borderRadius: BorderRadius.circular(14)),
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.notifications,
                      color: Color(0XFFE9E3D5),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () async {
                  final result = await showSearch(
                    context: context,
                    delegate: CustomSearch(),
                  );
                  if (result != null) {
                    print("Selected Category: $result");
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 14, 71, 96), borderRadius: BorderRadius.circular(14)),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0XFFE9E3D5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Search...',
                        style: TextStyle(
                          color: Color(0XFFE9E3D5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Slideshow(),
                ),
              ),
              Expanded(child: PostsScreen()),
            ],
          ),
        ),
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
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultList = categoryname.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(resultList[index]),
        onTap: () {
          close(context, resultList[index]);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? categoryname
        : categoryname.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
      ),
    );
  }
}