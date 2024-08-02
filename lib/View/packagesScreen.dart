import 'package:flutter/material.dart';



class packagesScreen extends StatefulWidget {
  @override
  _packagesScreenState createState() => _packagesScreenState();
}

class _packagesScreenState extends State<packagesScreen> {
  int quantity = 0;
  int selectedPackageId = 0;
  bool isCustomQuantity = false;

  List<Map<String, dynamic>> packages = [
    {'id': 1, 'posts': 1, 'price': '10.00'},
    {'id': 2, 'posts': 10, 'price': '90.00'},
    {'id': 3, 'posts': 20, 'price': '170.00'},
    {'id': 4, 'posts': 50, 'price': '400.00'},
  ];

  void selectPackage(int id) {
    setState(() {
      selectedPackageId = id;
      isCustomQuantity = false;
    });

    print('Selected package ID: $selectedPackageId');
  }

  void sendQuantityToBackend(int quantity) {

    print('Quantity sent to backend: $quantity');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff033043),
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: Text('Purchase Packages'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile(
              title: Text('Enter custom number of posts',style: TextStyle(color: Colors.white60),),
              value: true,
              groupValue: isCustomQuantity,
              onChanged: (bool? value) {
                setState(() {
                  isCustomQuantity = value ?? false;
                });
              },
            ),
            if (isCustomQuantity)
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter number of posts',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    quantity = int.parse(value);
                  });
                },
                onSubmitted: (value) {
                  sendQuantityToBackend(quantity);
                },
              ),
            RadioListTile(
              title: Text('Choose a package',style: TextStyle(color: Colors.white60)),
              value: false,
              groupValue: isCustomQuantity,
              onChanged: (bool? value) {
                setState(() {
                  isCustomQuantity = value ?? false;
                });
              },
            ),
            if (!isCustomQuantity)
              Expanded(
                child: ListView.builder(
                  itemCount: packages.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('Package ${packages[index]['id']}'),
                        subtitle: Text(
                            'Posts: ${packages[index]['posts']}, Price: \$${packages[index]['price']}'),
                        trailing: selectedPackageId == packages[index]['id']
                            ? Icon(Icons.check_circle, color: Colors.green)
                            : null,
                        onTap: () {
                          selectPackage(packages[index]['id']);
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
