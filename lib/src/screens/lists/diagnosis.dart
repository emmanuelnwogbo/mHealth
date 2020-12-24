import 'package:flutter/material.dart';

class Diagnosis extends StatefulWidget {
  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  var symptoms = <String>[
    "ARE YOU EXPERIENCING ANY OF THESE SYMPTOMS?",
    "Mid Fever",
    "High Fever",
    "Dry Cough",
    "Wet Cough",
    "Nasal Congestion",
    "Headaches",
    "Loss of Appetite",
    "Fatigue"
  ];

  var includedSymptoms = <String>[];

  void _addSymptom(item) {
    var symps = includedSymptoms;
    symps.contains(item) ? symps.remove(item) : symps.insert(0, item);

    setState(() {
      includedSymptoms = symps;
    });
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
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xFF454F63),
                            size: 27.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
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

                        return GestureDetector(
                            onTap: () {
                              _addSymptom(item);
                            },
                            child: Container(
                                //height: 60.0,
                                margin: EdgeInsets.only(
                                    top: 3.0, left: 17, right: 17, bottom: 10),
                                padding: EdgeInsets.only(
                                    top: index == 1 ? 40 : 0, bottom: 16.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7F7FA),
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0, color: Color(0xFFD9D9D9)),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          item,
                                          style: TextStyle(
                                            color: Color(0xFF454F63),
                                            decoration: TextDecoration.none,
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
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: Color(0xFF665EFF),
                                          width: 1.5,
                                        ),
                                        color: includedSymptoms.contains(item)
                                            ? Color(0xFF665EFF)
                                            : Color(0xFFFFFFFF),
                                      ),
                                    )
                                  ],
                                )));
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
                        onPressed: () {},
                      ),
                    ),
                  )),
                ),
              ],
            )));
  }
}
