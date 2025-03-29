import 'package:LMS/screens/availableBookList.dart';
import 'package:flutter/material.dart';

class CatagoriesBooks extends StatefulWidget {
  const CatagoriesBooks({super.key});

  @override
  State<CatagoriesBooks> createState() => _CatagoriesBooksState();
}

class _CatagoriesBooksState extends State<CatagoriesBooks> {
  List<String> categories = [
    'Bca',
    'Mca',
    'Bjmc',
    'BA',
    'Dpharma',
    'Mca',
    'Bcom',
    'Bba',
    'Bsc',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue.shade400,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text('Books Categories',style: TextStyle(
           color: Colors.white, fontFamily: 'serif', fontSize: 21),
          ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.7,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [inkwellCards("MCA"), inkwellCards("MBA"), inkwellCards("BCA")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [inkwellCards("B.COM"), inkwellCards("B.A"), inkwellCards("B.SC(MATHS)")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [inkwellCards("BBA"), inkwellCards("D.PHARMA"), inkwellCards("B.SC(BIO)")],
            )
          ],
        ),
      ),
    );
  }

  // for categories card
  inkwellCards(String categoryText) {
    return InkWell(
      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return AvailableBookList();}));},
      child: Column(
        children: [
          Icon(
            Icons.book,
            size: 105,
            color: Colors.blue,
          ),
          Text(
            '$categoryText',
            style: TextStyle(
                color: Colors.blue, fontFamily: 'serif', fontSize: 16),
          ),
        ],
      ),
    );
  }
}
