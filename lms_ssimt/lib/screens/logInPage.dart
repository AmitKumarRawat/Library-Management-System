import 'package:flutter/material.dart';
import 'package:LMS/screens/forgotPage.dart';
import 'package:LMS/screens/myHomePage.dart';
import 'package:LMS/screens/signUpPage.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _TextFeildController_for_username = TextEditingController();
  final _TextFeildController_for_password = TextEditingController();
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _TextFeildController_for_username.text = "";
    _TextFeildController_for_password.text = "";
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
              image: AssetImage("images/bg3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 27,
                  ),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'LMS',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'cursive',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'serif',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
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
                          height: 55,
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'serif',
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        // email code is here
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Card(
                            elevation: 4,
                            shadowColor: Colors.grey,
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.77,
                              child: TextField(
                                controller: _TextFeildController_for_username,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIconColor: Colors.black,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide.none),
                                  hintText: 'Enter your E-mail',
                                  labelText: 'E-mail',
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
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: 'serif'),
                              ),
                            ),
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
                                obscureText: !_showPassword,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                    child: _showPassword
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                  ),
                                  prefixIcon: const Icon(Icons.person),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIconColor: Colors.black,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
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
                      
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const ForgotPage();
                                }));
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'serif',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            login_result();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue, elevation: 2),
                          child: const Text(
                            "Login ",
                            style: TextStyle(
                                fontFamily: "serif",
                                fontSize: 21,
                                color: Colors.white),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(height: 55),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 61,
                                ),
                                const Text(
                                  "Don't have an account?  ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'serif',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return SignUpPage();
                                      }));
                                    },
                                    child: const Center(
                                      child: Text(
                                        'Sign Up ',
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
                      ]),
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

  void login_result() {
    String email = _TextFeildController_for_username.text.toString().trim();
    String password = _TextFeildController_for_password.text.toString().trim();
    if (email == "") {
      showAlert(context, "Please Enter email id");
    }else if(password == ""){
      showAlert(context, "Please Enter password");
    }else{
    email == "amit@ak.com" && password == "Amit#123"
        ? Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }))
        : showAlert(context, "Please enter Email-id & Password Correctly ");
  }
  }
  void showAlert(BuildContext context, var message){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Center(child: Text('  \n \n  $message \n \n ',style: TextStyle(fontSize: 16,fontFamily: 'serif',color: Colors.black),)),
      icon: Icon(Icons.info,size: 51,),
      iconColor: Colors.lightBlue,
      actions: [
        ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text(' Ok ',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: Colors.blue
        ),),
        SizedBox(width: 70,)
      ],
    );
  },);
}
}
