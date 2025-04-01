import 'package:flutter/material.dart';

class Addbooksinlibrary extends StatefulWidget {
  const Addbooksinlibrary({super.key});

  @override
  State<Addbooksinlibrary> createState() => _AddbooksinlibraryState();
}

class _AddbooksinlibraryState extends State<Addbooksinlibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue.shade400,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: Text('Add Books in Library',style: TextStyle(
           color: Colors.white, fontFamily: 'serif', fontSize: 21),
          ),
      ),
      body: Center(),
    );
  }
}