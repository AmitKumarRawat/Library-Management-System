import 'package:flutter/material.dart';
import 'package:LMS/screens/logInPage.dart';

class SignUpAdmin extends StatefulWidget {
  const SignUpAdmin({super.key});

  @override
  State<SignUpAdmin> createState() => _SignUpAdminState();
}

class _SignUpAdminState extends State<SignUpAdmin> {
  final _TextFeildController_for_username = TextEditingController();
  final _TextFeildController_for_email = TextEditingController();
  final _TextFeildController_for_phone = TextEditingController();
  final _TextFeildController_for_password = TextEditingController();
  final _TextFeildController_for_confirmPassword = TextEditingController();
  @override
  void initState() {
    super.initState();
    _TextFeildController_for_username.text = "";
    _TextFeildController_for_email.text = "";
    _TextFeildController_for_phone.text = "";
    _TextFeildController_for_password.text = "";
    _TextFeildController_for_confirmPassword.text = "";
  }

  String selectedGender = "male";
  bool _showPassword = true, _showPassword1 = true;
  signUpElement(String hintT, Icon icon_name, String label,
      TextInputType keyboard, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.77,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon_name,
              filled: true,
              fillColor: Colors.white,
              prefixIconColor: Colors.black,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none),
              hintText: hintT,
              labelText: label,
              labelStyle: const TextStyle(
                  fontSize: 16, color: Colors.black, fontFamily: 'serif'),
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'serif',
              ),
            ),
            keyboardType: keyboard,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: 'serif'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/profileOne.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 27,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        shape: const CircleBorder(),
                        elevation: 6,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                  image: AssetImage('images/lmsLogo.png'))),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'serif',
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(54),
                          topRight: Radius.circular(54),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: [
                          const SizedBox(
                            height: 21,
                          ),
                          // name code is here
                          signUpElement(
                              'Enter your name',
                              Icon(Icons.person),
                              'Name',
                              TextInputType.name,
                              _TextFeildController_for_username),

                          // email code is here
                          signUpElement(
                              'Enter your E-mail',
                              Icon(Icons.email),
                              'E-mail',
                              TextInputType.emailAddress,
                              _TextFeildController_for_email),

                          //mobile no code is here
                          signUpElement(
                              'Enter your Phone-No',
                              Icon(Icons.call),
                              'Phone-No',
                              TextInputType.phone,
                              _TextFeildController_for_phone),

                          //gender code is here
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Card(
                              elevation: 4,
                              shadowColor: Colors.grey,
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.77,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 11, right: 15),
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
                                                            activeColor:
                                                                Colors.blue,
                                                            value: "male",
                                                            groupValue:
                                                                selectedGender,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                selectedGender =
                                                                    val!;
                                                              });
                                                            }),
                                                        const Text(
                                                          'Male\t \t',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'serif'),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.person_2),
                                                        Radio(
                                                            activeColor:
                                                                Colors.blue,
                                                            value: "female",
                                                            groupValue:
                                                                selectedGender,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                selectedGender =
                                                                    val!;
                                                              });
                                                            }),
                                                        const Text(
                                                          'Female',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'serif'),
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
                          ),
                          
                         
                          // password code is here
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Card(
                              shadowColor: Colors.grey,
                              elevation: 4,
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.77,
                                child: TextField(
                                  controller: _TextFeildController_for_password,
                                  obscureText: _showPassword,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                      child: _showPassword
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                    ),
                                    prefixIcon: const Icon(Icons.password),
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIconColor: Colors.black,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide.none),
                                    hintText: 'Enter your password',
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'serif'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'serif',
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'serif'),
                                ),
                              ),
                            ),
                          ),

                          // confirm password code is here
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Card(
                              shadowColor: Colors.grey,
                              elevation: 4,
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.77,
                                child: TextField(
                                  controller:
                                      _TextFeildController_for_confirmPassword,
                                  obscureText: _showPassword1,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _showPassword1 = !_showPassword1;
                                        });
                                      },
                                      child: _showPassword1
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility),
                                    ),
                                    prefixIcon: const Icon(Icons.password),
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIconColor: Colors.black,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: BorderSide.none),
                                    hintText: 'Re-Enter your password',
                                    labelText: 'Confirm Password',
                                    labelStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'serif'),
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'serif',
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'serif'),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              signUp_result();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                elevation: 2),
                            child: const Text(
                              "Sign Up ",
                              style: TextStyle(
                                  fontFamily: "serif",
                                  fontSize: 21,
                                  color: Colors.white),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 61,
                                  ),
                                  const Text(
                                    'Already have  an account? ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'serif',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const LogInPage();
                                        }));
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Log In ',
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontFamily: 'serif',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 171,
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void signUp_result() {
    String name = _TextFeildController_for_username.text.toString().trim();
    String email = _TextFeildController_for_email.text.toString().trim();
    String phone = _TextFeildController_for_phone.text.toString().trim();
    String password = _TextFeildController_for_password.text.toString().trim();
    String cnfPassword =
        _TextFeildController_for_confirmPassword.text.toString().trim();
    if (name == "") {
      showAlert(context, "Please Enter name");
    } else if (email == "") {
      showAlert(context, "Please Enter email id");
    } else if (phone == "") {
      showAlert(context, "Please Enter Phone no");
    } else if (password == "") {
      showAlert(context, "Please Enter password");
    } else if (cnfPassword == "") {
      showAlert(context, "Please confirm password");
    } else {
      if (password != cnfPassword) {
        showAlert(context, "Confirm password must be same as password");
      } else {}
    }
  }

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
}
