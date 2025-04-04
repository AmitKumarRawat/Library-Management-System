import 'dart:io';
import 'package:LMS/screens/alert.dart';
import 'package:LMS/screens/myHomePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({super.key});

  @override
  State<Updateprofile> createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fatherNController = TextEditingController();
  TextEditingController courseController = TextEditingController();
    TextEditingController addressController = TextEditingController();
  String selectedGender = "male";
 File? _image;
 final _picker = ImagePicker();
  imagePick() async{
 final pickedFile= await  _picker.pickImage(source: ImageSource.gallery);
 if(pickedFile != null){
    setState(() {
       _image = File(pickedFile.path);
    });
 }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          title: Row(
            children: [
              Text(
                'Update Profile ',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'serif', fontSize: 21),
              ),
              Icon(
                Icons.edit,
                color: Colors.white,
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 11, right: 11, bottom: 21),
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
                          child:  GestureDetector(
                            onTap: imagePick,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              backgroundImage: _image != null ? FileImage(_image!) : null,
                              child: _image == null?
                                   Icon(Icons.camera_alt, size: 60, color: Colors.white70)
                                  : null,
                            ),
                          ),
                        
                      )),
                ),
                const SizedBox(height: 20),
                updateTextField("Name", "Enter Name", Icons.person,nameController,TextInputType.name),
                const SizedBox(height: 10),
                updateTextField('phone', 'Enter mobile number', Icons.phone,phoneController,TextInputType.phone),
                const SizedBox(height: 10),
                updateTextField(
                    "Father's name", "Enter father's name", Icons.person,fatherNController,TextInputType.name),
                const SizedBox(height: 10),
                 Card(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.blue.withOpacity(0.23),
                              spreadRadius: 5,
                              blurRadius: 10,
                            )
                          ]
                        ),
                        width: MediaQuery.sizeOf(context).width * 0.84,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 11, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.person_pin),
                                      Text(
                                        '\t \tGender',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: 'serif'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.person),
                                              Radio(
                                                  activeColor: Colors.blue,
                                                  value: "male",
                                                  groupValue: selectedGender,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      selectedGender = val!;
                                                    });
                                                  }),
                                              const Text(
                                                'Male\t \t',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontFamily: 'serif'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.person_2),
                                              Radio(
                                                  activeColor: Colors.blue,
                                                  value: "female",
                                                  groupValue: selectedGender,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      selectedGender = val!;
                                                    });
                                                  }),
                                              const Text(
                                                'Female',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontFamily: 'serif'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
              
                const SizedBox(height: 10),
                updateTextField('Course', 'Enter course & year', Icons.school,courseController,TextInputType.text),
                const SizedBox(height: 10),
                updateTextField(
                    'Address', 'Enter current address', Icons.location_city,addressController,TextInputType.text),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      updateClickButton();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    child: const Text(
                      'Update Profile Now',
                      style:
                          TextStyle(color: Colors.white, fontFamily: "serif"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  updateTextField(String label, String hintText, IconData icondata,TextEditingController controller,TextInputType keyboard) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.84,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.blue.withOpacity(0.23),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ]),
      child: ListTile(
        title: TextField(
          keyboardType: keyboard,
          controller:controller ,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              label: Text("$label"),
              hintStyle: TextStyle(color: Colors.grey.shade500)
              ),
        ),
        leading: Icon(icondata),
        tileColor: Colors.white,
      ),
    );
  }
  updateClickButton(){
    String name = nameController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String fathername =
        fatherNController.text.toString().trim();
    String course = courseController.text.toString().trim();
    String address = addressController.text.toString().trim();
   
    if (name == "") {
      showAlert(context, "Please Enter name");
    }  else if (phone == "") {
      showAlert(context, "Please Enter Phone no");
    } else if (fathername == "") {
      showAlert(context, "Please Enter Father's name");
    } else if (course == "") {
      showAlert(context, "Please Enter your course & year");
    } else if (address == "") {
      showAlert(context, "Please Enter your current address");
    } else {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 11, left: 11, right: 11),
        content: Text(
          "User details updated Successfully",
          textAlign: TextAlign.center,
        )));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return MyHomePage();
            }));
      
    }
  }
}
