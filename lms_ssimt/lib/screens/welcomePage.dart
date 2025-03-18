import 'package:flutter/material.dart';
import 'package:lms_ssimt/screens/logInPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height *0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                      shape: const CircleBorder(),
                      elevation: 6,
                      child: Container(
                        height: 100,
                        width:100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(image:AssetImage('images/shardaLogo.jpeg') )
                        ),
                          ),
                  ),
                  const Text(
                    ' Library Management System',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
               height: MediaQuery.sizeOf(context).height *0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,elevation: 4,
                  ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return const LogInPage();}));
                      },
                      child: const Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color:  Colors.white),
                      )),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 51,
                      ),
                      Icon(
                        Icons.school_rounded,
                        size: 21,
                      ),
                      Text(
                        '\t||\t',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        ' Initiated by SSIMT',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
