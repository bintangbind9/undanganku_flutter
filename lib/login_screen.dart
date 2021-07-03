import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_invitation/main_screen.dart';
import 'package:star_invitation/model/users.dart';
import 'package:star_invitation/general.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();

@override
void dispose() {
  _passController.dispose();
  _emailController.dispose();
  // super.dispose();
}

int idxData(String email, String pass) {
  int id = -1;

  for (int i = 0; i < userList.length; i++) {
    if (email.trim() == userList[i].email.trim() && pass == userList[i].pass) {
      id = i;
    }
  }

  return id;
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // return OrientationBuilder(builder: (context, orientation) {
    //   if (orientation == Orientation.portrait) {
    //     return LoginMobileScreen();
    //   } else {
    //     return LoginWebScreen();
    //   }
    // });
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 770) {
          return LoginMobileScreen();
        } else {
          return LoginWebScreen();
        }
      },
    );
  }
}

class LoginMobileScreen extends StatefulWidget {
  @override
  _LoginMobileScreenState createState() => _LoginMobileScreenState();
}

class _LoginMobileScreenState extends State<LoginMobileScreen> {
  int idData = -1;
  bool resultObscureText = true;
  // String _email = '';
  // String _pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/mail-invitation.png'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: Colors.white, style: BorderStyle.none),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigoAccent,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text('LOGIN', style: mainTextLogin),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.white, style: BorderStyle.none),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.indigo,
                                  offset: Offset(-3, 3),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                // icon: Icon(Icons.person, color: Colors.white,),
                                labelText: 'Email',
                                labelStyle: inputTextLogin,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                              textAlign: TextAlign.start,
                              cursorColor: Colors.white,
                              style: inputTextLogin,
                              // onChanged: (String value) {
                              //   setState(() {
                              //     _email = value;
                              //   });
                              // },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Colors.white, style: BorderStyle.none),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.indigo,
                                  offset: Offset(-3, 3),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: _passController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                // icon: Icon(Icons.person, color: Colors.white,),
                                labelText: 'Password',
                                labelStyle: inputTextLogin,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                // suffixIcon: InkWell(
                                //   // onTapDown: (context) {
                                //   //   resultObscureText = !resultObscureText;
                                //   // },
                                //   onTap: () {
                                //     resultObscureText = !resultObscureText;
                                //   },
                                //   child: Icon(
                                //     Icons.remove_red_eye,
                                //     color: Colors.white,
                                //   ),
                                // ),
                              ),
                              textAlign: TextAlign.start,
                              cursorColor: Colors.white,
                              style: inputTextLogin,
                              obscureText: resultObscureText,
                              // onChanged: (String value) {
                              //   setState(() {
                              //     _pass = value;
                              //   });
                              // },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.none),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.indigo,
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.login,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text('Login', style: inputTextLogin),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              idData = idxData(
                                  _emailController.text, _passController.text);
                              if (idData > -1) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainScreen(user: userList[idData]);
                                })).then((value) {
                                  // _emailController.clear();
                                  _passController.clear();
                                });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          scrollable: true,
                                          backgroundColor: Colors.white,
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK')),
                                          ],
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.error,
                                                  color: Colors.orange),
                                              SizedBox(width: 4),
                                              Text('Login Error',
                                                  style: alertTitleText,
                                                  textAlign: TextAlign.center)
                                            ],
                                          ),
                                          content: Text(
                                            'User or Password is wrong!',
                                            style: alertContentText,
                                            textAlign: TextAlign.center,
                                          ));
                                    });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _passController.dispose();
  //   _emailController.dispose();
  //   super.dispose();
  // }
}

class LoginWebScreen extends StatefulWidget {
  @override
  _LoginWebScreenState createState() => _LoginWebScreenState();
}

class _LoginWebScreenState extends State<LoginWebScreen> {
  int idData = -1;
  bool resultObscureText = true;
  // String _email = '';
  // String _pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Image.asset('images/mail-invitation.png',
                      fit: BoxFit.contain),
                  Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Container(
                      // constraints:
                      //     BoxConstraints(minWidth: 300, maxWidth: 300),
                      // width: 300,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.white, style: BorderStyle.none),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigoAccent,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('LOGIN', style: mainTextLogin),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.none),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo,
                                    offset: Offset(-3, 3),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  // icon: Icon(Icons.person, color: Colors.white,),
                                  labelText: 'Email',
                                  labelStyle: inputTextLogin,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                textAlign: TextAlign.start,
                                cursorColor: Colors.white,
                                style: inputTextLogin,
                                // onChanged: (String value) {
                                //   setState(() {
                                //     _email = value;
                                //   });
                                // },
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.none),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo,
                                    offset: Offset(-3, 3),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                              child: TextField(
                                controller: _passController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  // icon: Icon(Icons.person, color: Colors.white,),
                                  labelText: 'Password',
                                  labelStyle: inputTextLogin,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  // suffixIcon: InkWell(
                                  //   // onTapDown: (context) {
                                  //   //   resultObscureText = !resultObscureText;
                                  //   // },
                                  //   onTap: () {
                                  //     resultObscureText = !resultObscureText;
                                  //   },
                                  //   child: Icon(
                                  //     Icons.remove_red_eye,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                ),
                                textAlign: TextAlign.start,
                                cursorColor: Colors.white,
                                style: inputTextLogin,
                                obscureText: resultObscureText,
                                // onChanged: (String value) {
                                //   setState(() {
                                //     _pass = value;
                                //   });
                                // },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.none),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.indigo,
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.login,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text('Login', style: inputTextLogin),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                idData = idxData(_emailController.text,
                                    _passController.text);
                                if (idData > -1) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MainScreen(user: userList[idData]);
                                  })).then((value) {
                                    // _emailController.clear();
                                    _passController.clear();
                                  });
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            scrollable: true,
                                            backgroundColor: Colors.white,
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK')),
                                            ],
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.error,
                                                    color: Colors.orange),
                                                SizedBox(width: 4),
                                                Text('Login Error',
                                                    style: alertTitleText,
                                                    textAlign: TextAlign.center)
                                              ],
                                            ),
                                            content: Text(
                                              'User or Password is wrong!',
                                              style: alertContentText,
                                              textAlign: TextAlign.center,
                                            ));
                                      });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _passController.dispose();
  //   _emailController.dispose();
  //   super.dispose();
  // }
}
