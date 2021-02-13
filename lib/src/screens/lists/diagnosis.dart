import 'package:flutter/material.dart';
import 'dart:math';

import '../user/dashboard.dart';

import 'dart:convert' as convert;
import 'dart:async';
import 'package:http/http.dart' as http;

class Diagnosis extends StatefulWidget {
  String baseUrl;
  Diagnosis(this.baseUrl);
  @override
  _DiagnosisState createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXJfdXVpZCI6ImU2OTljMTFiLTJiNDQtNGIwMi1hYmE4LWM0OTQ0ODk2Y2Y1OSIsImZpcnN0X25hbWUiOiJMaW5kYSBZb3VuZyIsImxhc3RfbmFtZSI6Ikxvb3AiLCJlbWFpbCI6ImxpbmRheW91bmczMkBnbWFpbC5jb20iLCJwaG9uZSI6bnVsbCwiYWdlIjpudWxsLCJnZW5kZXIiOm51bGwsImFkZHJlc3MiOm51bGwsImlzX3ZlcmlmaWVkIjowLCJwcm9maWxlX2lzX2NvbXBsZXRlIjowLCJjcmVhdGVkQXQiOiIyMDIxLTAyLTAzVDIwOjMyOjUyLjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIxLTAyLTAzVDIwOjMyOjUyLjAwMFoifSwiaWF0IjoxNjEzMTQ4MTcyLCJleHAiOjE2MTM3NTI5NzJ9.RwE1F1nIdTmjfe-IJNO3Y6yEb8G3sOD7nqcPJP2fufQ";

  final String urlGetter = "https://medhealthurl.herokuapp.com/url";
  String baseUrlTwo = "";

  bool isLoading = false;

  int max = 1;

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
    "Headache",
    "Erythema",
    "Nausea",
    "Eye Manifestation",
    "Back Pain",
    "Angina",
    "Seizures",
    "Polymyalgia",
    "Weakness",
    "Insomnia",
    "Joint Pain",
    "Stomach Pain",
    "Rash",
    "Muscleache",
    "Constipation",
    "Swollen Stomach",
    "Vomiting"
  ];

  Map symptomCodes = {
    "SYM00001": 0,
    "SYM00002": 0,
    "SYM00003": 0,
    "SYM00004": 0,
    "SYM00005": 0,
    "SYM00006": 0,
    "SYM00007": 0,
    "SYM00008": 0,
    "SYM00009": 0,
    "SYM00010": 0,
    "SYM00011": 0,
    "SYM00012": 0,
    "SYM00013": 0,
    "SYM00014": 0,
    "SYM00015": 0,
    "SYM00016": 0,
    "SYM00017": 0,
    "SYM00018": 0,
    "SYM00019": 0,
    "SYM00020": 0,
    "SYM00021": 0,
    "SYM00022": 0,
    "SYM00023": 0,
    "SYM00024": 0,
    "SYM00025": 0,
    "SYM00026": 0,
    "SYM00027": 0,
  };

  getDiagnosis() async {
    /*double randomNumber = Random().nextDouble() * 1;

    print(randomNumber);

    Future.delayed(const Duration(milliseconds: 1900), () {
      var tuberculosis =
          "Tuberculosis ${(Random().nextDouble() * 1 * 100).toStringAsFixed(1)}%";
      var typhoid =
          "Typhoid ${(Random().nextDouble() * 1 * 100).toStringAsFixed(1)}%";
      var malaria =
          "Malaria ${(Random().nextDouble() * 1 * 100).toStringAsFixed(1)}%";
      setState(() {
        diagnosis = [
          tuberculosis,
          typhoid,
          malaria,
        ];
      });

      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
      );

      setState(() {
        isLoading = false;
      });
    });*/

    print(symptomCodes);
    print(convert.json.encode(symptomCodes));

    Map data = symptomCodes;

    await http
        .post("$baseUrlTwo/diagnosis/diagnose",
            headers: {
              'Authorization': 'Bearer $token',
              'Content-type': 'application/json'
            },
            body: convert.json.encode(data))
        .then((response) {
      setState(() {
        isLoading = false;
      });
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse["data"]);
      var tuberculosis =
          "Tuberculosis ${(jsonResponse["data"]["Tuberculosis"] * 100).toStringAsFixed(1)}%";
      var typhoid =
          "Typhoid ${(jsonResponse["data"]["Typhoid"] * 100).toStringAsFixed(1)}%";
      var malaria =
          "Malaria ${(jsonResponse["data"]["Malaria"] * 100).toStringAsFixed(1)}%";
      setState(() {
        diagnosis = [
          tuberculosis,
          typhoid,
          malaria,
        ];
      });
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
      );

      setState(() {
        symptomCodes = {
          "SYM00001": 0,
          "SYM00002": 0,
          "SYM00003": 0,
          "SYM00004": 0,
          "SYM00005": 0,
          "SYM00006": 0,
          "SYM00007": 0,
          "SYM00008": 0,
          "SYM00009": 0,
          "SYM00010": 0,
          "SYM00011": 0,
          "SYM00012": 0,
          "SYM00013": 0,
          "SYM00014": 0,
          "SYM00015": 0,
          "SYM00016": 0,
          "SYM00017": 0,
          "SYM00018": 0,
          "SYM00019": 0,
          "SYM00020": 0,
          "SYM00021": 0,
          "SYM00022": 0,
          "SYM00023": 0,
          "SYM00024": 0,
          "SYM00025": 0,
          "SYM00026": 0,
          "SYM00027": 0,
        };
      });
    });
  }

  void initState() {
    print("============= a test here");
    print(widget.baseUrl);
    print("=============this is a test");
    print("$widget.baseUrl/diagnosis/diagnose");
    setState(() {
      baseUrlTwo = widget.baseUrl;
    });
    print("hdbg");
    print(baseUrlTwo);
    /*super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("WidgetsBinding");
      http.get(urlGetter).then((response) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse["url"]);
        setState(() {
          baseUrl = jsonResponse["url"];
        });
      });
    });*/
  }

  final List<DropdownMenuItem> symptomLabels = [
    DropdownMenuItem(
        value: "",
        child: Text('',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Color(0xFF454F63),
            ))),
    DropdownMenuItem(
        value: 1.00,
        child: Text('Severe',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Color(0xFF454F63),
            ))),
    DropdownMenuItem(
        value: 0.75,
        child: Text('High',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Color(0xFF454F63),
            ))),
    DropdownMenuItem(
        value: 0.50,
        child: Text('Low',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Color(0xFF454F63),
            ))),
    DropdownMenuItem(
        value: 0.25,
        child: Text('Very Low',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Color(0xFF454F63),
            ))),
    DropdownMenuItem(
        value: 0.00,
        child: Text('Not Evident',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: Color(0xFF454F63),
            )))
  ];

  var includedSymptoms = <String>[];

  String empty = " ";

  String dropdownValue = " ";

  String selectedSymptom = " ";

  var diagnosis = <String>[
    "Tuberculosis 0.12%",
    "Typhoid 98.12%",
    "Malaria 2.12%",
  ];

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
                                /*Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Dashboard('', '', '')),
                                );*/
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
                                              child: DropdownButton(
                                                  value: "",
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
                                                  onChanged: (value) {
                                                    setState(() {
                                                      //dropdownValue = newValue;
                                                    });

                                                    switch (item) {
                                                      case "Cough":
                                                        {
                                                          print(value);
                                                          print(
                                                              "================");
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00001"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;

                                                      case "Fever":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00002"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Chest Pain":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00003"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Weight loss":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00004"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Fatigue":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00005"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Sweat":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00006"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Chills":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00007"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Loss of Appetite":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00008"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Diarrhea":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00009"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Facial Pain":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00010"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Headache":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00011"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Erythema":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00012"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Nausea":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00013"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Eye Manifestation":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00014"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Back Pain":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00015"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Angina":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00016"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Seizures":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00017"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Polymyalgia":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00018"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Weakness":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00019"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Insomnia":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00020"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Joint Pain":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00021"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Stomach Pain":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00022"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Rash":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00023"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Muscleache":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00024"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Constipation":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00025"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Swollen Stomach":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00026"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      case "Vomiting":
                                                        {
                                                          var tempSym =
                                                              symptomCodes;
                                                          tempSym["SYM00027"] =
                                                              value;
                                                          setState(() {
                                                            symptomCodes =
                                                                tempSym;
                                                          });
                                                        }
                                                        break;
                                                      default:
                                                        {
                                                          //statements;
                                                        }
                                                        break;
                                                    }
                                                  },
                                                  items: symptomLabels),
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
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                'SUBMIT'.toUpperCase(),
                                style: TextStyle(fontSize: 19.0),
                              ),
                        color: Color(0xFF665EFF),
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          getDiagnosis();
                        },
                      ),
                    ),
                  )),
                ),
              ],
            )));
  }
}
