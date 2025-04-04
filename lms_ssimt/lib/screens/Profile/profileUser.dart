import 'package:LMS/screens/Profile/updateProfile.dart';
import 'package:flutter/material.dart';

class Profileuser extends StatefulWidget {
  const Profileuser({super.key});

  @override
  State<Profileuser> createState() => _ProfileuserState();
}

class _ProfileuserState extends State<Profileuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor:  Colors.blue.shade400,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text('Profile',style: TextStyle(
           color: Colors.white, fontFamily: 'serif', fontSize: 21),
          ),
      ),
        body: Padding(
          padding:  EdgeInsets.only(left: 11,right: 11,bottom: 21),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
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
                        padding: const EdgeInsets.all(2.0),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('images/profilePic.png'),
                        ),
                      )),
                ),
                const SizedBox(height: 20),
                itemProfile("Name", "Ravi", Icons.person),
                const SizedBox(height: 10),
                itemProfile('Email', 'ravi@gmailcom', Icons.email),
                const SizedBox(height: 10),
                itemProfile('phone', '+91 8973628893', Icons.phone),
                const SizedBox(height: 10),
                  itemProfile("Father's name", 'Ramesh Raw', Icons.person),
              const SizedBox(height: 10),
                itemProfile('Gender', 'Male', Icons.person_3),
              const SizedBox(height: 10),
                itemProfile('Course', 'BCA -6', Icons.school),
              const SizedBox(height: 10),
                itemProfile('Address', 'Gosai Gang, Lucknow', Icons.location_city),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.of(context).push(
                           MaterialPageRoute(builder: (context) => Updateprofile()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    child: const Text('Edit Profile',style: TextStyle(color: Colors.white,fontFamily: "serif"),),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  itemProfile(String title, String subtitle, IconData icondata) {
    return Container(
        width: MediaQuery.sizeOf(context).width * 0.84,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color:Colors.blue.withOpacity(0.23),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icondata),
        tileColor: Colors.white,
      ),
    );
  }
}
