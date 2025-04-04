import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final emailController = TextEditingController();
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
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
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: AssetImage('images/lmsLogo.png'))),
                    ),
                  ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(54),
                          bottomRight: Radius.circular(54)),
                    ),
                    child: Column(children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Text(
                        'Forgot password',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'serif',
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 32,
                      ),

                      // email code here

                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          child: SizedBox(
                            width:  MediaQuery.sizeOf(context).width *0.77,
                            child: TextField(
                              controller: emailController,
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
                        height: 32,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          submit_check();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue, elevation: 2),
                        child: const Text(
                          "Submit",
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
                                width: 21,
                              ),
                              const Text(
                                'Back to login  ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'serif',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              InkWell(
                                  onTap: () {
                                   Navigator.of(context).pop();
                                  },
                                  child: const Center(
                                    child: Icon(Icons.login, size: 32),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
  
  void submit_check() {
    String email = emailController.text.toString().trim();
    if(email == ""){
      showDialog(context: context, builder: (context){return AlertDialog(
      title: Center(child: Text('  \n \n Enter email address  \n \n ',style: TextStyle(fontSize: 21,fontFamily: 'serif',color: Colors.black),)),
      icon: Icon(Icons.info,size: 51,),
      iconColor: Colors.lightBlue,
    ); });
    }
  }
}