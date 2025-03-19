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
  int _currentIndex = 0, _currentIndexCard = 0;
  final List<String> cardList = [
    "11+ Years of Academic Excellence.",
    "NEP Driven Curriculum.",
    " Employability enhancement Program.",
    "National And Global Tie-ups."
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
          iconTheme: IconThemeData(
            color: Colors.blue,
            size: 35,
          ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: MediaQuery.sizeOf(context).width,
                color: Colors.blue,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 55)),
                      SizedBox(
                        width: 8,
                      ),
                      Card(
                        elevation: 4,
                        shape: CircleBorder(),
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                gradient: const SweepGradient(
                                  colors: [
                                    Colors.red,
                                    Colors.yellow,
                                    Colors.blue,
                                    Colors.green,
                                    Colors.red,
                                    Colors.teal,
                                    Colors.purple,
                                  ],
                                  stops: <double>[
                                    0.0,
                                    0.25,
                                    0.5,
                                    0.75,
                                    1.0,
                                    0.44,
                                    0.21
                                  ],
                                  tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/lmsLogo.png'),
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Container(
                        child: Text(
                          'user email place here',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'serif'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              ),
              Column(
                children: [
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
      body: Container(
        height: MediaQuery.sizeOf(context).height * 1,
        width: MediaQuery.sizeOf(context).width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Carousel Slider
            Padding(
              padding: const EdgeInsets.only(left: 11, right: 11),
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: Image.asset(
                      imageList[index],
                      fit: BoxFit.cover, // Prevents image from being cropped
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height *
                      0.3, // Adjust slider height
                  enlargeCenterPage:
                      false, // Optional: This enlarges the center image
                  viewportFraction: 1.0, // To make images take up full width
                  autoPlay: true, // Automatically slide through images
                  autoPlayInterval:
                      Duration(seconds: 5), // Time for auto play transition
                  aspectRatio: 19 / 16, // Maintain the aspect ratio
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }, // Enable looping of images
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // Dot Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageList.length,
                (index) => Card(
                  elevation: 3,
                  shape: CircleBorder(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: _currentIndex == index ? 10 : 10,
                    height: _currentIndex == index ? 10 : 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      color:
                          _currentIndex == index ? Colors.white : Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            
            CarouselSlider.builder(
                itemCount: cardList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 11,right: 11),
                    child: Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(21)
                      ),
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                           color: const Color.fromARGB(255, 33, 149, 243),
                        ),
                       
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.school,color: Colors.white,),
                            Text('${cardList[index]}',style: TextStyle(color: Colors.white,fontFamily: 'serif',fontSize: 16),textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 101,
                  enlargeCenterPage: true,
                viewportFraction: 1,
                  autoPlay: true,
                  aspectRatio: 29/5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndexCard = index;
                    });
                  },
                )),
                // dot indecators
                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageList.length,
                (index) => Card(
                  elevation: 3,
                  shape: CircleBorder(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: _currentIndex == index ? 10 : 10,
                    height: _currentIndex == index ? 10 : 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      color:
                          _currentIndexCard == index ? Colors.white : Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
