import 'package:flutter/material.dart';
 void showAlert(BuildContext context, var message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            '  \n \n  $message \n \n ',
            style: TextStyle(
                fontSize: 16, fontFamily: 'serif', color: Colors.black),
          )),
          icon: Icon(
            Icons.info,
            size: 51,
          ),
          iconColor: Colors.lightBlue,
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  ' Ok ',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center, backgroundColor: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }