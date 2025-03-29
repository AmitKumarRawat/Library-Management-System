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
        backgroundColor: Colors.blue.shade400,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          'Book List',
          style:
              TextStyle(color: Colors.white, fontFamily: 'serif', fontSize: 21),
        ),
      ),
      body: ListView.builder(
        itemCount: avialableBooks.length,
        itemBuilder: (context, index) {
          final item = avialableBooks[index];
          return Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ExpansionTile(
              //  contentPadding: EdgeInsets.all(16.0),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(item['icon'], color: Colors.white),
              ),
              title: Text(
                item['bookName'],
                style: TextStyle(
                  fontFamily: "serif",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("see details",style: TextStyle(color: Colors.blue),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Author Name is :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),),
                            Text(
                              item['authorName'],
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Text(
                            'Accession Number is : ${index + 1}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            'Quantity is : ${index + 10}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        
                      ],
                    ),
                  ),
                )
              ],

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
