import 'package:flutter/material.dart';

class My_post extends StatelessWidget {
  // بيانات وهمية للبوستات
  final List<Map<String, String>> posts = [
    {
      "name": "John Doe",
      "profilePic": "images/photo_2024-07-29_14-11-17.jpg", // استخدام صورة محلية
      "content": "This is the content of the post by John Doe."
    },
    {
      "name": "Jane Smith",
      "profilePic": "images/photo_2024-07-29_14-11-17.jpg", // استخدام صورة محلية
      "content": "This is the content of the post by Jane Smith."
    },
    // أضف بوستات أخرى حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My posts'),),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostItem(
            name: post['name']!,
            profilePic: post['profilePic']!,
            content: post['content']!,
          );
        },
      ),
    );
  }
}

class PostItem extends StatefulWidget {
  final String name;
  final String profilePic;
  final String content;

  PostItem({
    required this.name,
    required this.profilePic,
    required this.content,
  });

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isFavorite = false; // حالة المفضلة

  void _showReportOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('False information'),
                onTap: () {
                  // قم بإضافة الكود اللازم لمعالجة هذا الخيار
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Fake account'),
                onTap: () {
                  // قم بإضافة الكود اللازم لمعالجة هذا الخيار
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('I don\'t want to see this'),
                onTap: () {
                  // قم بإضافة الكود اللازم لمعالجة هذا الخيار
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Something else'),
                onTap: () {
                  // قم بإضافة الكود اللازم لمعالجة هذا الخيار
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _acceptPost() {
    // هنا يمكنك إضافة الكود اللازم لتنفيذ عملية القبول
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم قبول البوست')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(widget.profilePic),
                ),
                SizedBox(width: 10),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(widget.content),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite; // تبديل حالة المفضلة عند الضغط
                    });
                    // هنا يمكنك إضافة الكود اللازم لإضافة البوست للمفضلة
                  },
                ),
                IconButton(
                  icon: Icon(Icons.report),
                  onPressed: _showReportOptions,
                ),
                TextButton(
                  onPressed: () {
                    // هنا يمكنك إضافة الكود اللازم لتنفيذ عملية التقديم
                  },
                  child: Text('Apply'),
                  style: TextButton.styleFrom(
                   // primary: Colors.white,
                    backgroundColor: Color(0XFF092337),
                  ),
                ),
                TextButton(
                  onPressed: _acceptPost,
                  child: Text('Accept'),
                  style: TextButton.styleFrom(
                   // primary: Colors.white,
                    backgroundColor: Color(0XFF092337),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
