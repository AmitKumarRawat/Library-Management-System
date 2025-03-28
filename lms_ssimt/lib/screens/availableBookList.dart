import 'package:flutter/material.dart';

class AvailableBookList extends StatefulWidget {
  const AvailableBookList({super.key});

  @override
  State<AvailableBookList> createState() => _AvailableBookListState();
}

class _AvailableBookListState extends State<AvailableBookList> {
  final List<Map<String, dynamic>> avialableBooks = [
    {
      "bookName": "Data Structure & Algorithms",
      "authorName": "E Bala Goswami",
      "icon": Icons.book,
      "availability": "available",
      "isAvailable": true
    },
    {
      "bookName": "Physics",
      "authorName": "Newton Jha",
      "icon": Icons.book,
      "availability": "available",
      "isAvailable": true
    },
    {
      "bookName": "Networking",
      "authorName": "Shradha Khapra",
      "icon": Icons.book,
      "availability": "not Abailable",
      "isAvailable": false
    },
    {
      "bookName": "Cryptography",
      "authorName": "PK Shinha",
      "icon": Icons.book,
      "availability": "available",
      "isAvailable": true
    },
    {
      "bookName": "Mathematics",
      "authorName": "Robert T",
      "icon": Icons.book,
      "availability": "available",
      "isAvailable": true
    },
    {
      "bookName": "Operating System ",
      "authorName": "Preeti Shinha",
      "icon": Icons.book,
      "availability": "not Abailable",
      "isAvailable": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.blue,
          size: 30,
        ),
        title: Text(
          'Book List',
          style:
              TextStyle(color: Colors.blue, fontFamily: 'serif', fontSize: 21),
        ),
      ),
      body: ListView.builder(
        itemCount: avialableBooks.length,
        itemBuilder: (context, index) {
          final item = avialableBooks[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.book, color: Colors.white),
              ),
              title: Text(
                item['bookName'],
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                item['authorName'],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                item['availability'],
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 16,
                  color: item['isAvailable'] ? Colors.green : Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
