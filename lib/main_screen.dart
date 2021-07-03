import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';

import 'package:star_invitation/model/users.dart';
import 'package:star_invitation/model/templates.dart';
import 'package:star_invitation/template_screen.dart';
import 'package:star_invitation/general.dart';

String imageTemplate = '';
String imageDesc = '';

bool findTemplate(String name) {
  bool result = false;

  for (int i = 0; i < templateList.length; i++) {
    imageTemplate = '';
    imageDesc = '';
    result = false;

    if (name.trim() == templateList[i].name.trim()) {
      imageTemplate = templateList[i].image;
      imageDesc = templateList[i].desc;
      result = true;
      i = templateList.length;
    }
  }

  return result;
}

class MainScreen extends StatelessWidget {
  final Users user;

  MainScreen({required this.user});

  bool isStarred(String status) {
    if (status == 'Starred') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons.supervisor_account_outlined),),
        // foregroundColor: Colors.white,
        toolbarTextStyle: contentTextStyle,
        titleTextStyle: mainTextStyle,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text('Home', style: mainTextStyle),
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        // ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo,
                    offset: Offset(-3, 3),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                    top: Radius.zero, bottom: Radius.circular(20)),
                color: Colors.indigo,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('images/' + user.image,
                            width: 100, height: 100, fit: BoxFit.cover)),
                    Text(user.name, style: mainTextStyle),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.indigo,
              ),
              title: Text(
                user.status,
                style: contentDrawerTitleTextStyle,
              ),
              subtitle: Text(
                'Member',
                style: contentDrawerSubTitleTextStyle,
              ),
              trailing: Icon(
                  isStarred(user.status) ? Icons.star : Icons.star_outline,
                  color: Colors.indigo),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.window,
                color: Colors.indigo,
              ),
              title: Text(
                'Template',
                style: contentDrawerTitleTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Container(
                width: 120,
                child: Text(
                  user.template,
                  style: contentDrawerSubTitleTextStyle,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  template = user.template;
                  return MainTemplateScreen();
                })).then((value) {});
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.indigo,
              ),
              title: Text(
                'Guests',
                style: contentDrawerTitleTextStyle,
              ),
              trailing: Text(
                user.guests.toString(),
                style: contentDrawerSubTitleTextStyle,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.image,
                color: Colors.indigo,
              ),
              title: Text(
                'Galleries',
                style: contentDrawerTitleTextStyle,
              ),
              trailing: Text(
                user.imgGalleries.length.toString(),
                style: contentDrawerSubTitleTextStyle,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.speaker_notes,
                color: Colors.indigo,
              ),
              title: Text(
                'Greetings',
                style: contentDrawerTitleTextStyle,
              ),
              trailing: Text(
                user.greetings.toString(),
                style: contentDrawerSubTitleTextStyle,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.indigo,
              ),
              title: Text(
                'Logout',
                style: contentDrawerTitleTextStyle,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return LoginScreen();
                // }));
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Template', style: subTextStyle),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.indigoAccent,
                        offset: Offset(0, 0),
                        blurRadius: 10)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      template = user.template;
                      return MainTemplateScreen();
                    })).then((value) {});
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        findTemplate(user.template)
                            ? Image.asset(
                                'images/templates/' + imageTemplate,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'images/mail-invitation.png',
                                fit: BoxFit.cover,
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
                                      color: Color.fromRGBO(38, 38, 38, 0.4))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.template,
                                  style: subTextStyle,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Value', style: subTextStyle),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 20,
                                offset: Offset(0, 0),
                                color: Colors.indigoAccent)
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.indigo),
                            child: Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Guests',
                            style: subTextStyle,
                          ),
                          SizedBox(height: 10),
                          Text(
                            user.guests.toString(),
                            style: mainTextStyle,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View all',
                                style: contentTextStyle,
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors.white, size: 16),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 20,
                                offset: Offset(0, 0),
                                color: Colors.indigoAccent)
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.indigo),
                            child: Icon(
                              Icons.speaker_notes,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Greetings',
                            style: subTextStyle,
                          ),
                          SizedBox(height: 10),
                          Text(
                            user.greetings.toString(),
                            style: mainTextStyle,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View all',
                                style: contentTextStyle,
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors.white, size: 16),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Galleries (' + user.imgGalleries.length.toString() + ')', style: subTextStyle),
              Icon(Icons.add, color: Colors.white),
            ]),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.indigoAccent,
                          offset: Offset(0, 0),
                          blurRadius: 10)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: user.imgGalleries.map((img) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('images/galleries/' + img),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
