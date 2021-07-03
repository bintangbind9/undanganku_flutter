import 'package:flutter/material.dart';
import 'package:star_invitation/general.dart';
import 'package:flutter/cupertino.dart';
import 'package:star_invitation/model/templates.dart';

String? template;

class MainTemplateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        toolbarTextStyle: contentTextStyle,
        titleTextStyle: mainTextStyle,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text('Template', style: mainTextStyle),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.check)),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 300) {
            return TemplateScreen(
              gridCount: 1,
              template: template,
            );
          } else if (constraints.maxWidth <= 500) {
            return TemplateScreen(
              gridCount: 2,
              template: template,
            );
          } else if (constraints.maxWidth <= 700) {
            return TemplateScreen(
              gridCount: 3,
              template: template,
            );
          } else if (constraints.maxWidth <= 900) {
            return TemplateScreen(
              gridCount: 4,
              template: template,
            );
          } else if (constraints.maxWidth <= 1100) {
            return TemplateScreen(
              gridCount: 5,
              template: template,
            );
          } else if (constraints.maxWidth <= 1300) {
            return TemplateScreen(
              gridCount: 6,
              template: template,
            );
          } else if (constraints.maxWidth <= 1500) {
            return TemplateScreen(
              gridCount: 7,
              template: template,
            );
          } else {
            return TemplateScreen(
              gridCount: 8,
              template: template,
            );
          }
        },
      ),
    );
  }
}

class TemplateScreen extends StatefulWidget {
  final int gridCount;

  TemplateScreen({required this.gridCount, required template});

  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: widget.gridCount,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        children: templateList.map((temp) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.indigoAccent,
                          offset: Offset(0, 0),
                          blurRadius: 5)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                        onTap: () {
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
                                          child: Text('Close')),
                                    ],
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.info, color: Colors.indigo),
                                        SizedBox(width: 4),
                                        Text(temp.name + ' - Preview',
                                            style: alertTitleText,
                                            textAlign: TextAlign.center)
                                      ],
                                    ),
                                    content: Image.asset(
                                        'images/templates/' + temp.image));
                              });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('images/templates/' + temp.image,
                              fit: BoxFit.cover),
                        ),
                      ),
                    )),
                    Row(
                      children: [
                        Radio<String>(
                          hoverColor: Colors.white,
                          activeColor: Colors.white,
                          value: temp.name,
                          groupValue: template,
                          onChanged: (String? value) {
                            setState(() {
                              template = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              temp.name,
                              style: contentTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          );
        }).toList(),
      ),
    );
  }
}
