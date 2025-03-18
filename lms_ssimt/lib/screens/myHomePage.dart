import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imageList = [
    'images/frontImg2.png',
    'images/frontImg1.png',
    'images/frontimg3.png',
    'images/frontImg4.png',
  ];
  drawerCards(Icon icon, String title) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: BeveledRectangleBorder(),
      child: ListTile(
        leading: icon,
        title:
            Text('$title', style: TextStyle(color: Colors.blue, fontSize: 14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Text(
                'Library Management System',
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                  topRight: Radius.circular(150))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 55)),
              Row(children: [
                SizedBox(
                  width: 8,
                ),
                Card(
                  elevation: 4,
                  shape: CircleBorder(),
                  child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('images/shardaLogo.jpeg'),
                      )),
                ),
                const SizedBox(
                  width: 11,
                ),
                Container(
                  child: Text('LMS',
                      style: TextStyle(fontSize: 21, color: Colors.black)),
                ),
              ]),
              Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 55)),
                  drawerCards(Icon(Icons.home, color: Colors.blueAccent),
                      "Home Page"), //home page
                  drawerCards(Icon(Icons.school, color: Colors.blueAccent),
                      "Cources"), //cources
                  drawerCards(Icon(Icons.logout, color: Colors.blueAccent),
                      'Log Out'), //logout
                  drawerCards(Icon(Icons.policy, color: Colors.blueAccent),
                      'Policy & Facts'), //'Policy & Facts'
                  drawerCards(Icon(Icons.info, color: Colors.blueAccent),
                      'About & Contact us'), //'About & Contact us'
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Carousel Slider
           Padding(
             padding: const EdgeInsets.only(left: 21,right: 21),
             child: CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return  Card(
                    elevation: 3,
                    shape: BeveledRectangleBorder(),
                    child: Image.asset(
                        imageList[index],
                        fit: BoxFit.cover, // Prevents image from being cropped
                      ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.38, // Adjust slider height
                  enlargeCenterPage:
                      false, // Optional: This enlarges the center image
                  viewportFraction: 1.0, // To make images take up full width
                  autoPlay: true, // Automatically slide through images
                  autoPlayInterval:
                      Duration(seconds: 5), // Time for auto play transition
                  aspectRatio: 19 / 16, // Maintain the aspect ratio
                  enableInfiniteScroll: true, // Enable looping of images
                ),
              ),
           ),

        ],
      ),
    );
  }
}
