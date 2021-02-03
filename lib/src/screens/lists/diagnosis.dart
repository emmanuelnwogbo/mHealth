import 'package:flutter/material.dart';

import '../user/dashboard.dart';

class Diagnosis extends StatefulWidget {
  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  var symptoms = <String>[
    "ARE YOU EXPERIENCING ANY OF THESE SYMPTOMS?",
    "Cough",
    "Fever",
    "Chest Pain",
    "Weight loss",
    "Fatigue",
    "Sweat",
    "Chills",
    "Loss of Appetite",
    "Diarrhea",
    "Facial Pain",
    "Headache"
  ];

  var includedSymptoms = <String>[];

  String empty = " ";

  String dropdownValue = " ";

  String selectedSymptom = " ";

  var diagnosis = <String>["Typhoid 98.12%", "Malaria 2.12%", "Cold 0.12%"];

  void _addSymptom(item) {
    var symps = includedSymptoms;
    symps.contains(item) ? symps.remove(item) : symps.insert(0, item);

    setState(() {
      includedSymptoms = symps;
    });
  }

  void _setSymptom(item) {
    selectedSymptom == item
        ? setState(() {
            selectedSymptom = "";
          })
        : setState(() {
            selectedSymptom = item;
          });
  }

  Widget _buildPopupDialog(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return new AlertDialog(
      backgroundColor: Color(0xFF2A2E43),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: new Text(
        "You've been diagnosed".toUpperCase(),
        style: TextStyle(fontSize: 17.0, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      content: new SingleChildScrollView(
          child: Container(
              height: mediaQuery.size.height / 3,
              decoration: BoxDecoration(
                color: Color(0xFF2A2E43),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: ListView.builder(
                        itemCount: diagnosis.length,
                        itemBuilder: (context, index) {
                          final item = diagnosis[index];

                          return Column(
                            children: <Widget>[
                              Text(
                                item,
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Color(0xFF665EFF),
                              width: 1.5,
                            ),
                            color: Color(0xFF665EFF),
                          ),
                          height: mediaQuery.size.height / 15,
                          child: Center(
                            child: FlatButton(
                              child: Text(
                                'visit pharmacy'.toUpperCase(),
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                              color: Color(0xFF665EFF),
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        )),
                        SizedBox(height: 20),
                        GestureDetector(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Color(0xFF665EFF),
                              width: 1.5,
                            ),
                            color: Color(0xFFF4F4F4),
                          ),
                          height: mediaQuery.size.height / 15,
                          child: Center(
                            child: FlatButton(
                              child: Text(
                                'consult a doctor'.toUpperCase(),
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                              color: Colors.white,
                              textColor: Color(0xFF665EFF),
                              onPressed: () {},
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ))),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text(''),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Container(
            height: mediaQuery.size.height,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: mediaQuery.size.height / 17,
                        left: 17,
                        right: 17,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xFF454F63),
                                size: 27.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 15,
                        left: 17,
                      ),
                      child: Text(
                        "Diagnosis",
                        style: TextStyle(
                          fontSize: 38.0,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          color: Color(0xFF665EFF),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: symptoms.length,
                      itemBuilder: (context, index) {
                        final item = symptoms[index];

                        if (item ==
                            "ARE YOU EXPERIENCING ANY OF THESE SYMPTOMS?") {
                          return Container(
                              padding: EdgeInsets.only(
                                left: 17,
                                top: 17,
                                bottom: 17,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: 1.0, color: Color(0xFFD9D9D9)),
                                ),
                              ),
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: Color(0xFF454F63),
                                  decoration: TextDecoration.none,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ));
                        }

                        return Stack(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _setSymptom(item);
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        //height: 60.0,
                                        margin: EdgeInsets.only(
                                            top: 3.0,
                                            left: 17,
                                            right: 17,
                                            bottom: 10),
                                        padding: EdgeInsets.only(
                                            top: index == 1 ? 40 : 0,
                                            bottom: 16.0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF7F7FA),
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Color(0xFFD9D9D9)),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  item,
                                                  style: TextStyle(
                                                    color: Color(0xFF454F63),
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 40,
                                              child: DropdownButton<String>(
                                                value: dropdownValue,
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Color(0xFF454F63),
                                                  size: 25.0,
                                                  semanticLabel:
                                                      'Text to announce in accessibility modes',
                                                ),
                                                iconSize: 24,
                                                elevation: 16,
                                                style: TextStyle(
                                                    color: Colors.deepPurple),
                                                underline: Container(
                                                    //height: 2,
                                                    //color: Colors.deepPurpleAccent,
                                                    ),
                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    //dropdownValue = newValue;
                                                  });
                                                },
                                                items: <String>[
                                                  empty,
                                                  'Severe',
                                                  'High',
                                                  'Low',
                                                  'Very Low',
                                                  'Not Evident',
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return value == " " ? DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Container(),
                                                  ) : DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value,
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color:
                                                              Color(0xFF454F63),
                                                        )),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                )),
                          ],
                        );
                      },
                    )),
                    SizedBox(height: 75.0)
                  ],
                ),
                Positioned(
                    right: 25,
                    bottom: 130,
                    child: GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(left: 10, right: 14),
                          width: 160,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Color(0xFF665EFF),
                              width: 1.5,
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Color(0xFF454F63),
                                  size: 20.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                                Text(
                                  'Add Symptoms',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xFF454F63),
                                  ),
                                )
                              ],
                            ),
                          )),
                    )),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: GestureDetector(
                      child: Container(
                    height: mediaQuery.size.height / 12,
                    width: mediaQuery.size.width,
                    color: Color(0xFF665EFF),
                    child: Center(
                      child: FlatButton(
                        child: Text(
                          'SUBMIT'.toUpperCase(),
                          style: TextStyle(fontSize: 19.0),
                        ),
                        color: Color(0xFF665EFF),
                        textColor: Colors.white,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(context),
                          );
                        },
                      ),
                    ),
                  )),
                ),
              ],
            )));
  }
}
