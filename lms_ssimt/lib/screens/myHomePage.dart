import 'package:LMS/screens/Profile/updateProfile.dart';
import 'package:LMS/screens/addBooksInLibrary.dart';
import 'package:LMS/screens/categoriesBooks.dart';
import 'package:LMS/screens/logInPage.dart';
import 'package:LMS/screens/Profile/profileUser.dart';
import 'package:LMS/screens/removeBookList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  drawerCards(Icon icon, String title, dynamic method) {
    return InkWell(
      onTap: method,
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: BeveledRectangleBorder(),
        child: ListTile(
          leading: icon,
          title: Text('$title',
              style: TextStyle(color: Colors.blue, fontSize: 14)),
        ),
      ),
    );
  }

  // Fake data for search suggestions
  final List<String> searchSuggestions = [
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

  int currentIdx = 1;
  void whereTogo(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          elevation: 3,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue.shade400,
           title: Text('Library Management System',style: TextStyle(
           color: Colors.white, fontFamily: 'serif', fontSize: 21),
          ),
          
        ),
        // drawer code  starts here
        drawer: Drawer(
          elevation: 3,
          shadowColor: Colors.grey,
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(150),
                      topRight: Radius.circular(150))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: MediaQuery.sizeOf(context).height * 0.25,
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.blue.shade400,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DrawerHeader(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  whereTogo(Profileuser());
                                },
                                child: Card(
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
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'images/profilePic.png'),
                                        ),
                                      )),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'ravi@gmailcom',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'serif'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                       drawerCards(Icon(Icons.home, color: Colors.blueAccent),
                          "Update Profile", () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){return Updateprofile();}));
                      }),// Update user
                      drawerCards(Icon(Icons.home, color: Colors.blueAccent),
                          "Home Page", () {
                        Navigator.of(context).pop();
                      }), //home page
                      drawerCards(
                          Icon(Icons.category_rounded,
                              color: Colors.blueAccent),
                          "Search Books", () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CatagoriesBooks();
                        }));
                      }), //cources
                      drawerCards(Icon(Icons.logout, color: Colors.blueAccent),
                          'Log Out', () {
                        Navigator.of(super.context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return LogInPage();
                        }));
                      }), //logout
                      drawerCards(Icon(Icons.policy, color: Colors.blueAccent),
                          'Policy & Facts', () {}), //'Policy & Facts'
                      drawerCards(Icon(Icons.info, color: Colors.blueAccent),
                          'About & Contact us', () {}), //'About & Contact us'
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 1,
            width: MediaQuery.sizeOf(context).width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //search box Code is here

               Container(
                margin: EdgeInsets.only(bottom: 11),
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        }
                        return searchSuggestions.where((String suggestion) {
                          return suggestion
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        print('You selected: $selection');
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23.0)),
                            elevation: 7,
                            shadowColor: Colors.blue.shade400,
                            child: TextField(
                                 controller: controller,
                                 focusNode: focusNode,
                              style: const TextStyle(
                                  fontFamily: 'serif', fontSize: 18),
                              autocorrect: true,
                              showCursor: true,
                              // onSubmitted: (value) => _sendMessage(),
                              decoration: InputDecoration(
                                hintText: "Search Books . . .",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontFamily: 'serif',
                                ),
                                prefixIcon: const Icon(
                                  Icons.manage_search,
                                  size: 32,
                                ),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                

                // Carousel Slider
                Padding(
                  padding: const EdgeInsets.only(left: 11, right: 11),
                  child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Image.asset(
                          imageList[index],
                          fit:
                              BoxFit.cover, // Prevents image from being cropped
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height *
                          0.3, // Adjust slider height
                      enlargeCenterPage:
                          false, // Optional: This enlarges the center image
                      viewportFraction:
                          1.0, // To make images take up full width
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
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),

                CarouselSlider.builder(
                    itemCount: cardList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 11, right: 11),
                        child: Card(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
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
                                Icon(
                                  Icons.school,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${cardList[index]}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'serif',
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
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
                      aspectRatio: 29 / 5,
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
                          color: _currentIndexCard == index
                              ? Colors.white
                              : Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                // for add or remove only admin
                Container(
                  margin: EdgeInsets.only(top: 11),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Addbooksinlibrary();
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.shade400,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Text("Add Books",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'serif',
                                            fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade400,
                                        border: Border.all(
                                            width: 2, color: Colors.white12),
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Removebooklist();
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.shade300,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(11),
                                      bottomRight: Radius.circular(11))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade400,
                                        border: Border.all(
                                            width: 2, color: Colors.white12),
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Text("Remove books",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'serif',
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 11,),
                         Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return Addbooksinlibrary();
                              // }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade300,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(11),
                                      bottomLeft: Radius.circular(11))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Text("Issue Books",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'serif',
                                            fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade400,
                                        border: Border.all(
                                            width: 2, color: Colors.white12),
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                      child: Icon(
                                        Icons.bookmark_added_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (context) {
                              //   return Removebooklist();
                              // }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green.shade400,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(11),
                                      bottomRight: Radius.circular(11))),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey.shade400,
                                        border: Border.all(
                                            width: 2, color: Colors.white12),
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Text("Return books",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'serif',
                                            fontSize: 16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // for footer only
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blue.withOpacity(0.3),
            color: Colors.blue,
            buttonBackgroundColor: Colors.lightBlueAccent,
            index: 1,
            onTap: (index) {
              setState(() {
                currentIdx = index;
                if (currentIdx == 0) {
                  whereTogo(CatagoriesBooks());
                }
                if (currentIdx == 2) {
                  whereTogo(Profileuser());
                }
              });
            },
            items: [
              Tab(
                icon: Icon(
                  Icons.category,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.policy,
                  size: 26,
                  color: Colors.white,
                ),
              )
            ]));
  }
}
